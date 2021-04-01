//
//  Bundle_Decodable.swift
//  Green4all
//
//  Created by vincent schmitt on 23/03/2021.
//

import Foundation


extension Bundle {
    func decode(_ file: String) -> StocksDaily {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(StocksDaily.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
