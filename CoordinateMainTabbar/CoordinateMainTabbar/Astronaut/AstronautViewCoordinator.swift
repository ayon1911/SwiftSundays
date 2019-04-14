//
//  FirstCoordinator.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class AstronautViewCoordinator: Coordinator, CreateNavigationItem {

    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let vc = AstronautVC()
        vc.coordinator = self
        createNavigationContoller(nav: navigationController, vc: vc, title: "Astronaut", imageName: "astronaut")
        createNavigationItems(viewController: vc, target: self, right: #selector(handleRight), left: #selector(handleLeft))
    }
    
    @objc func handleRight() {
        navigationController.pushViewController(UIViewController(), animated: false)
    }
    
    
    @objc func handleLeft() {
        navigationController.pushViewController(UIViewController(), animated: false)
    }
}


