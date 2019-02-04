//
//  Date-Future.swift
//  InnerPeace
//
//  Created by krAyon on 04.02.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import Foundation

extension Date {
    func byAdding(days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? self
    }
}
