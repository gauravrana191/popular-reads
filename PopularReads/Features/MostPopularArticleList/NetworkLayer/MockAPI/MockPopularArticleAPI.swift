//
//  MockPopularArticleAPI.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

final class MockPopularArticleAPI: PopularArticleAPIRepresentable {
    
    let jsonLoader = JSONLoader()
    var articleListCase: Case = .successWithMultipleArticles
    
    func fetchArticles() async throws -> [Article] {
        switch articleListCase {
        case .successWithMultipleArticles, .successWithSingleArticle, .successWithNoArticle, .decodingError:
            guard let fileName = articleListCase.fileName,
                  let response: ArticleResponse = jsonLoader.load(filename: fileName, type: ArticleResponse.self) else {
                throw AppError.decodingError
            }
            return response.results
        case .notFound:
            throw AppError.notFound
        case .networkError:
            throw AppError.networkError(NSError(domain: "", code: 500))
        case .unknownError:
            throw NSError(domain: "", code: 503)
        case .invalidURL:
            throw AppError.invalidURL
        }
    }
}

// MARK: - Enum for Test Cases

extension MockPopularArticleAPI {
    enum Case {
        case successWithNoArticle
        case successWithMultipleArticles
        case successWithSingleArticle
        case invalidURL
        case notFound
        case networkError
        case decodingError
        case unknownError

        var fileName: String? {
            switch self {
            case .successWithNoArticle:
                return "no-article"
            case .successWithMultipleArticles:
                return "articles"
            case .successWithSingleArticle:
                return "single-article"
            case .decodingError:
                return "decoding-error"
            default:
                return nil
            }
        }
    }
}

extension MockPopularArticleAPI {
    static var mocked: MockPopularArticleAPI {
        .init()
    }
}
