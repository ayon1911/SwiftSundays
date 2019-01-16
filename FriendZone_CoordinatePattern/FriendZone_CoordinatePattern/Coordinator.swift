//
//  Coordinator.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 16.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var naviagtionController: UINavigationController { get set }
    
    func start()
}
