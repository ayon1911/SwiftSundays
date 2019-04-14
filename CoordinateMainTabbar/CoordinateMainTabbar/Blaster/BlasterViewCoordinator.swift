//
//  BlasterViewCoordinator.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class BlasterViewCoordinator: Coordinator, CreateNavigationItem {
    
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let vc = BlasterVC()
        vc.coordinator = self
        
        createNavigationContoller(nav: navigationController, vc: vc, title: "Blaster", imageName: "blaster")
        createNavigationItems(viewController: vc, target: self, right: #selector(handleRight), left: #selector(handleLeft))
    }
    
    @objc func handleRight() {
        print("Hanlded Right")
    }
    
    @objc func handleLeft() {
        print("Handle Left")
    }
}
