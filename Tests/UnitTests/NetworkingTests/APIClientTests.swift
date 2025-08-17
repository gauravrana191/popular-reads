//
//  APIClientTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 17/08/25.
//

import XCTest
@testable import PopularReads

final class APIClientTests: XCTestCase {
    var client: APIClient!
    let baseURL = "https://example.com"

    override func setUp() {
        super.setUp()
        let session = makeMockSession()
        client = APIClient(baseURL: baseURL, session: session)
    }

    func testSendSuccessfulResponse() async throws {
        // Arrange mock
        let mockResponse = ArticleResponse.mocked
        let mockData = try JSONEncoder().encode(mockResponse)
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, mockData)
        }
        
        // Act
        let request = PopularArticlesRequest(apiKey: "test-key")
        let result: ArticleResponse = try await client.send(request)
        
        // Assert
        XCTAssertEqual(result.results.first?.title, "SwiftUI Testing Best Practices")
    }
    
    func testSendBadResponse() async throws {
        // Arrange mock
        let mockResponse = ArticleResponse.mocked
        let mockData = try JSONEncoder().encode(mockResponse)
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 422,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, mockData)
        }
        
        // Act & Assert
        let request = PopularArticlesRequest(apiKey: "test-key")
        do {
            _ = try await self.client.send(request)
        } catch let error as AppError {
            XCTAssertEqual(error, .badResponse)
        } catch {
            XCTFail("Expected decodingError, got \(error)")
        }
    }
    
    func testSendDecodingError() async {
        // Arrange bad JSON
        let badJSON = #"{"foo":"bar"}"#.data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, badJSON)
        }
        
        // Act & Assert
        let request = PopularArticlesRequest(apiKey: "test-key")
        do {
            _ = try await self.client.send(request)
        } catch let error as AppError {
            XCTAssertEqual(error, .decodingError)
        } catch {
            XCTFail("Expected decodingError, got \(error)")
        }
    }
}

extension APIClientTests {
    func makeMockSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: config)
    }
}
