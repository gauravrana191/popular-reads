//
//  PopularArticlesRequest.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import Foundation

struct PopularArticlesRequest: APIRequest {
    typealias Response = ArticleResponse
    
    let path = "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
    let method = "GET"
    let queryItems: [URLQueryItem]?
    
    init(apiKey: String) {
        self.queryItems = [URLQueryItem(name: "api-key", value: apiKey)]
    }
}
