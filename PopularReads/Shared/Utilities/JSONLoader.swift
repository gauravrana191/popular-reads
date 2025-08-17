//
//  JSONLoader.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

final class JSONLoader {
    private let bundle: Bundle

    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }

    func load<T: Decodable>(filename: String, type: T.Type) -> T? {
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}

