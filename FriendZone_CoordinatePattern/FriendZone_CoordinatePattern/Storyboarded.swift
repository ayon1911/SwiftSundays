//
//  Storyboarded.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 16.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        print("class name \(className)")
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
