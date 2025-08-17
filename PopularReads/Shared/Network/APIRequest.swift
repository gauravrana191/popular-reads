//
//  APIRequest.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import Foundation

protocol APIRequest {
    associatedtype Response: Decodable
    
    var path: String { get }
    var method: String { get } // GET, POST, etc.
    var queryItems: [URLQueryItem]? { get }
}
