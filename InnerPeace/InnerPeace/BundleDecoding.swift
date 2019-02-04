//
//  BundleDecoding.swift
//  InnerPeace
//
//  Created by krAyon on 04.02.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Unable to find the \(file) in the bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load the \(file) in the bundle")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from app bundle")
        }
        return loaded
    }
}
