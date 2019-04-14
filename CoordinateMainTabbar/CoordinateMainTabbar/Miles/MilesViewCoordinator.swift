//
//  MilesViewCoordinator.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 14.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class MilesViewCoordinator: Coordinator, CreateNavigationItem {
    

    
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let vc = MilesVC()
        vc.coordinator = self
        
        createNavigationContoller(nav: navigationController, vc: vc, title: "Miles", imageName: "")
    }
    
    @objc func handel () {
        print("I am printing---")
    }
    
}
