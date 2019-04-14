//
//  CreateNavigationItem.swift
//  CoordinateMainTabbar
//
//  Created by krAyon on 13.04.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

protocol CreateNavigationItem {
    func createNavigationItems(viewController: UIViewController, target: Self, right: Selector, left: Selector)
}

extension CreateNavigationItem {
    func createNavigationItems(viewController: UIViewController, target: Self, right: Selector, left: Selector) {
        viewController.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: target, action: right)
        viewController.navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .compose, target: target, action: left)
//        controller.navigationItem.titleView = UIImageView(image: UIImage(named: "dark1"))
    }
}

