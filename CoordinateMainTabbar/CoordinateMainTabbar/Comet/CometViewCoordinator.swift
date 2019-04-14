//
//  Miles&BonusViewCoordinator.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class CometViewCoordinator: Coordinator {
    
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let vc = CometVC()
        vc.coordinator = self
        createNavigationContoller(nav: navigationController, vc: vc, title: "Comet", imageName: "comet")
        
    }
}
