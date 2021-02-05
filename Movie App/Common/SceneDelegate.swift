//
//  SceneDelegate.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 07/10/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
                                   window = UIWindow(windowScene: windowScene)
                           //window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                           window?.windowScene = windowScene
                            let nav = UINavigationController()
                            window?.rootViewController = nav
                    
                            let router = SplashRouter(navigationController: nav, networking: getNetworking())
                               router.startSplash()
                                       window?.makeKeyAndVisible()
                    
                        } else { return }
        
    }
    
    func getNetworking() -> Networking {
        let config = Config(baseUri: Constants.baseUrl)
        let networking = AlamofireNetworking(config: config)
        return networking
    }
    
}

