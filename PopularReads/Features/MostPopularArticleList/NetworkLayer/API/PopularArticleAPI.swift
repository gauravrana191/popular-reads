//
//  PopularArticleAPI.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

final class PopularArticleAPI: PopularArticleAPIRepresentable {
    private let client: APIClient
    private let apiKey: String
    
    init(baseURL: String, apiKey: String) {
        self.client = APIClient(baseURL: baseURL)
        self.apiKey = apiKey
    }
    
    func fetchArticles() async throws -> [Article] {
        let request = PopularArticlesRequest(apiKey: apiKey)
        let response = try await client.send(request)
        return response.results
    }
}

