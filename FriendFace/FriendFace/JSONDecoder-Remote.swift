//
//  JSONDecoder-Remote.swift
//  FriendFace
//
//  Created by krAyon on 28.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, fromUrl url: String, handler: @escaping (T) -> ()) {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let downloadedData = try self.decode(type, from: data)
                DispatchQueue.main.async {
                    handler(downloadedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
