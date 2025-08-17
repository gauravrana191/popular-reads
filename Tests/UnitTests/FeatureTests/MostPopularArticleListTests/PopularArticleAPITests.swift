//
//  PopularArticleAPITests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest
@testable import PopularReads

final class PopularArticleAPITests: XCTestCase {
    
    var articleAPI: PopularArticleAPIRepresentable!
    
    override func setUpWithError() throws {
        articleAPI = MockPopularArticleAPI.mocked
    }

    override func tearDownWithError() throws {
        articleAPI = nil
    }
    
    func testInitialization() {
        XCTAssertNotNil(articleAPI)
    }
}

// Positive test cases
extension PopularArticleAPITests {
    func testFetchArticlesWithSucessNoArticle() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithNoArticle
        articleAPI = mockedAPI
        let articles = try await articleAPI.fetchArticles()
        XCTAssertTrue(articles.isEmpty)
    }
    
    func testFetchArticlesWithSucessSingleArticle() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithSingleArticle
        articleAPI = mockedAPI
        let articles = try await articleAPI.fetchArticles()
        XCTAssertEqual(articles.count, 1)
    }
    
    func testFetchArticlesWithSuccessMultipleArticles() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithMultipleArticles
        articleAPI = mockedAPI
        let articles = try await articleAPI.fetchArticles()
        XCTAssertEqual(articles.count, 20)
    }
}

// Negative test cases

extension PopularArticleAPITests {    
    func testFetchArticlesNotFound() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .notFound
        articleAPI = mockedAPI

        do {
            _ = try await articleAPI.fetchArticles()
            XCTFail("Expected to throw, but succeeded.")
        } catch let error as AppError {
            XCTAssertEqual(error, .notFound)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
    
    func testFetchArticlesNetworkError() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .networkError
        articleAPI = mockedAPI

        do {
            _ = try await articleAPI.fetchArticles()
            XCTFail("Expected to throw, but succeeded.")
        } catch let error as AppError {
            let err = NSError(domain: "", code: 500)
            let expectedError = AppError.networkError(err)
            XCTAssertEqual(error.localizedDescription, expectedError.localizedDescription)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
    
    func testFetchArticlesDecodingError() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .decodingError
        articleAPI = mockedAPI

        do {
            _ = try await articleAPI.fetchArticles()
            XCTFail("Expected to throw, but succeeded.")
        } catch let error as AppError {
            XCTAssertEqual(error, .decodingError)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
}
