//
//  PopularArticleAPIFactory.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import Foundation

enum PopularArticleAPIFactory {
    static func makeAPI(arguments: [String] = ProcessInfo.processInfo.arguments) -> PopularArticleAPIRepresentable {
        if arguments.contains("-uitestcase_loaded") {
            let mock = MockPopularArticleAPI.mocked
            mock.articleListCase = .successWithMultipleArticles
            return mock
        } else if arguments.contains("-uitestcase_error") {
            let mock = MockPopularArticleAPI.mocked
            mock.articleListCase = .notFound
            return mock
        } else if arguments.contains("-mocked") {
            return MockPopularArticleAPI.mocked
        } else {
            return PopularArticleAPI(
                baseURL: AppConfiguration.baseURL.stringValue,
                apiKey: AppConfiguration.apiKey.stringValue
            )
        }
    }
}
