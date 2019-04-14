//
//  Coordinator.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: CoordinatedNavigationController { get set }
    
    func createNavigationContoller(nav: UINavigationController, vc: UIViewController, title: String, imageName: String?)
}

extension Coordinator {
    func createNavigationContoller(nav: UINavigationController, vc: UIViewController, title: String, imageName: String?) {
        vc.view.backgroundColor = .white
        vc.navigationItem.title = title
        nav.tabBarItem = .init(title: title, image: UIImage(named: imageName!), selectedImage: UIImage(named: "hat"))
        nav.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -2.5)
        nav.viewControllers = [vc]
//        return nav
    }
}
