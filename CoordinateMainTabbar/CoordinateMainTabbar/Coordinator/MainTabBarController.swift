//
//  MainTabBarController.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let home = HomeCoordinator()
    let first = AstronautViewCoordinator()
    let comet = CometViewCoordinator()
    let blaster = BlasterViewCoordinator()
    let miles = MilesViewCoordinator()
    

    
    override func viewDidLoad() {
        
        viewControllers = [home.navigationController, first.navigationController, miles.navigationController, blaster.navigationController, comet.navigationController]
//        centerButton.frame = CGRect(x: view.center.x - 32, y: view.center.y - 74, width: 64, height: 64)
//        self.view.layoutIfNeeded()
//        view.insertSubview(centerButton, aboveSubview: tabBar)
        

    }
    
    
    
    @objc func handleCenterButton() {
     
    }
}

