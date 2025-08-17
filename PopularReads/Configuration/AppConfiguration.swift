//
//  AppConfiguration.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

enum AppConfiguration: String {
    case baseURL = "BASE_URL"
    case apiKey = "API_KEY"
    
    var stringValue: String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: self.rawValue) as? String, !value.isEmpty else {
            fatalError("Missing or empty \(self.rawValue) in Info.plist")
        }
        return value
    }
}
