//
//  MainCoordinator.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 16.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var naviagtionController: UINavigationController
    
    init(navController: UINavigationController) {
        self.naviagtionController = navController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        naviagtionController.pushViewController(vc, animated: false)
    }
    
    func configureFriend(friend: Friend) {
        let vc = FriendViewController.instantiate()
        print("Configuriung...")
        vc.coordinator = self
        vc.friend = friend
        naviagtionController.pushViewController(vc, animated: true)
    }
    
    func updateFriend(friend: Friend) {
        guard let vc = naviagtionController.viewControllers.first as? ViewController else { return }
        vc.updateFriend(friend: friend)
    }
}
