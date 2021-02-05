//
//  MainRouter.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 13.12.2020.
//

import UIKit

class MainRouter {

    public var navigationController: UINavigationController
    public var networking: Networking

    init(navigationController: UINavigationController, networking: Networking) {
        self.navigationController = navigationController
        self.networking = networking
    }
    
    func close() {
        navigationController.popViewController(animated: true)
    }
}
