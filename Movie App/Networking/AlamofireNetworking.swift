//
//  AlamofireNetworking.swift
//  Networking
//
//  Created by Sebastian Sarca on 14/08/2018.
//  Copyright © 2018 Mobiversal. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import Network

public class AlamofireNetworking: NSObject, Networking {
    
    private var config: Config
    private var networkingMonitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "com.hedengren.api.networking", qos: .background, attributes: .concurrent)
    private var currentReachabilityTask: DispatchWorkItem?
    
    @Published public var isReachable: Bool = false
    
    private var isReachableStream: AnyCancellable?
    
    private lazy var session: Session = {
        return .default
    }()
    
    
    public required init(config: Config) {
        self.config = config
        super.init()
        
        self.startListeningForConnection()
    }
    
    public func observeConnection(observer: @escaping (Bool) -> Void) {
        isReachableStream = $isReachable.sink(receiveValue: observer)
    }
    
    private func startListeningForConnection() {
        self.networkingMonitor.pathUpdateHandler = { path in
            self.isReachable = path.status == .satisfied
            debugPrint("Network is reachable: \(self.isReachable)")
        }
        
        let reachabilityQueue = DispatchQueue(label: "Reachability")
        self.networkingMonitor.start(queue: reachabilityQueue)
    }
    
    public func set(url: String) {
        self.config.baseUri = url
    }
    
    public func set(globalHeaders: HTTPHeaders) {
        config.globalHeaders = Config.defaultGlobalHeaders()
        globalHeaders.forEach({config.globalHeaders.update($0)})
    }
    
    public func invalidateSession() {
        guard let sessionCookie = HTTPCookieStorage.shared.cookies?.filter({$0.name == "session"}).first else {
            return
        }
        
        HTTPCookieStorage.shared.deleteCookie(sessionCookie)
    }
    
    @discardableResult
    public func call<Req>(request: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) -> CancelableRequest where Req : ApiRequest {
        
        let dispatchQueue = getQueueFrom(networkingQueue: request.fetchQueue)
        
        let requestData = RequestData(request: request, config: config)
        let cancelable = session.request(requestData.uri, method: requestData.method, parameters: requestData.parameters, encoding: requestData.encoding, headers: requestData.headers)
            .validate()
            .responseData(queue: dispatchQueue, completionHandler: { [weak self] (response) in
                self?.handleResponseData(response: response, request: request, onSuccess: onSuccess, onError: onError)
            })
        
        return cancelable
    }
    
    private func handleResponseData<Req>(response: DataResponse<Data, AFError>, request: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) where Req: ApiRequest {
        
        let requestData = RequestData(request: request, config: config)
        
        var log = """
        \n
        ---------Request start---------
        Full url: \(requestData.uri)
        Global headers: \(response.request?.allHTTPHeaderFields ?? requestData.headers.dictionary)
        \(request)
        """
        
        print(log)
        
        guard let data = response.data else {
            log = """
            \(log)
            "Received error: No data found"
            """
            print(log)
            onError(ApiError(message: "No data found", code: 0))
            return
        }
        
//        log = """
//        \(log)
//        Received response:\n \(data.prettyPrintedJSONString)
//        """
        print(log)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let statusCode = response.response?.statusCode
            if statusCode == 200 || statusCode == 201 {
                
                let model = try decoder.decode(Req.ApiResponse.self, from: data)
                log = """
                \(log)
                Received success
                """
                print(log)
                handleSuccess(request: request, response: model, completed: onSuccess)
            } else if let model = try? decoder.decode(ApiError.self, from: data) {
                handleError(request: request, error: model, log: &log, onError: onError)
            } else if let error = response.error {
                handleError(request: request, error: ApiError(error: error), log: &log, onError: onError)
            } else {
                let error = ApiError(message: "Something went bad!", code: statusCode ?? 0)
                handleError(request: request, error: error, log: &log, onError: onError)
            }
        } catch (let error) {
            let nsError = error as NSError
            let apiError = ApiError(message: nsError.debugDescription, code: nsError.code)
            handleError(request: request, error: apiError, log: &log, onError: onError)
        }
    }
    
    private func handleSuccess<Req>(request: Req, response: Req.ApiResponse, completed: @escaping (Req.ApiResponse) -> Void) where Req: ApiRequest {
        getQueueFrom(networkingQueue: request.resultQueue).async {
            completed(response)
        }
    }
    
    private func handleError<Req: ApiRequest>(request: Req, error: ApiError, log: inout String, onError: @escaping (ApiError) -> Void) {
        log = """
        \(log)
        Received error: \(error)
        """
        
        getQueueFrom(networkingQueue: request.resultQueue).async { [weak self] in
//            guard let sSelf = self else {return}
//            sSelf.interceptors.forEach({$0.interceptor?.networking(networking: sSelf, didReceiveError: error)})
            
            if error.wasIntercepted == false || error.wasIntercepted == nil {
                onError(error)
            }
        }
    }
    
    deinit {
        networkingMonitor.cancel()
    }
    
    
    public func set(requestAdapter: RequestAdapter, requestRetrier: RequestRetrier) {
        let adapterAndRetrier = Interceptor(adapter: requestAdapter, retrier: requestRetrier)
        
        session = Session(interceptor: adapterAndRetrier)
    }
    
}

extension AlamofireNetworking {
    fileprivate func getQueueFrom(networkingQueue: NetworkingQueueType) -> DispatchQueue {
        switch networkingQueue {
            case .main:
                return .main
            case .background:
                return queue
            case .custom(let queue):
                return queue
        }
    }
}

extension DataRequest: CancelableRequest {
    public func cancelRequest() {
        cancel()
    }
}
