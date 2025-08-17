//
//  PopularArticleRepresentable.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

protocol PopularArticleAPIRepresentable {
    func fetchArticles() async throws -> [Article]
}
