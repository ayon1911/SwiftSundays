//
//  Quote.swift
//  InnerPeace
//
//  Created by krAyon on 04.02.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import Foundation

struct Quote: Codable {
    var text: String
    var author: String
    var shareMessage: String {
        return "\"\(text)\" - \(author)"
    }
}
