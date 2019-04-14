//
//  MilesVC.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 14.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class MilesVC: UIViewController {
    
    var coordinator: MilesViewCoordinator?
    let centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tabbar = coordinator?.navigationController.tabBarController?.tabBar else { return }
        
        view.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.3294117647, blue: 0.2392156863, alpha: 1)
        view.insertSubview(centerButton, aboveSubview: tabbar)
        centerButton.addTarget(coordinator, action: #selector(MilesViewCoordinator.handel), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        guard let tabbar = coordinator?.navigationController.tabBarController?.tabBar else { return }
        centerButton.frame = CGRect(x: tabbar.center.x - 25, y: tabbar.center.y - 54, width: 50, height: 50)
    }

}
