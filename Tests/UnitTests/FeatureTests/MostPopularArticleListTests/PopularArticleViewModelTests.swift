//
//  PopularArticleViewModelTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest
@testable import PopularReads

@MainActor
final class PopularArticleViewModelTests: XCTestCase {
    
    var viewModel: PopularArticleViewModel!
    
    override func setUpWithError() throws {
        viewModel = PopularArticleViewModel(api: MockPopularArticleAPI.mocked)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitialization() {
        XCTAssertNotNil(viewModel.api)
        XCTAssertEqual(viewModel.state, .initial)
    }
}

// MARK: - Positive test cases
extension PopularArticleViewModelTests {
    
    func testLoadArticlesWithSuccessNoArticle() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithNoArticle
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000) // 0.1s

        if case .loaded(let articles) = viewModel.state {
            XCTAssertTrue(articles.isEmpty)
        } else {
            XCTFail("Expected loaded state")
        }
    }
    
    func testLoadArticlesWithSuccessSingleArticle() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithSingleArticle
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000)

        if case .loaded(let articles) = viewModel.state {
            XCTAssertEqual(articles.count, 1)
        } else {
            XCTFail("Expected loaded state")
        }
    }
    
    func testLoadArticlesWithSuccessMultipleArticle() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .successWithMultipleArticles
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000)

        if case .loaded(let articles) = viewModel.state {
            XCTAssertEqual(articles.count, 20)
        } else {
            XCTFail("Expected loaded state")
        }
    }
}

// MARK: - Negative test cases
extension PopularArticleViewModelTests {
    
    func testLoadArticlesWithNotFound() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .notFound
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000)

        if case .error(let message) = viewModel.state {
            XCTAssertEqual(message, "We couldn't find what you're looking for.")
        } else {
            XCTFail("Expected error state")
        }
    }
    
    func testLoadArticlesWithNetworkError() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .networkError
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000)

        if case .error(let message) = viewModel.state {
            XCTAssertEqual(message, "A network error occurred: The operation couldn’t be completed. ( error 500.)")
        } else {
            XCTFail("Expected error state")
        }
    }
    
    func testLoadArticlesWithInvalidResponse() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .decodingError
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 200_000_000)

        if case .error(let message) = viewModel.state {
            XCTAssertEqual(message, "Something went wrong. Please try again later.")
        } else {
            XCTFail("Expected error state")
        }
    }
    
    func testLoadArticlesWithUnknownError() async throws {
        let mockedAPI = MockPopularArticleAPI.mocked
        mockedAPI.articleListCase = .unknownError
        viewModel = PopularArticleViewModel(api: mockedAPI)

        viewModel.loadArticles()
        try await Task.sleep(nanoseconds: 100_000_000)

        if case .error(let message) = viewModel.state {
            XCTAssertEqual(message, "Something went wrong. Please try again later.")
        } else {
            XCTFail("Expected error state")
        }
    }
}
