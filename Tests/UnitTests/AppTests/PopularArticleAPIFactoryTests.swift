//
//  PopularArticleAPIFactoryTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 17/08/25.
//

import XCTest
@testable import PopularReads

final class PopularArticleAPIFactoryTests: XCTestCase {
    
    func testFactoryReturnsMockWithMultipleArticlesWhenLoadedArgumentPresent() {
        // Given
        let args = ["-uitestcase_loaded"]
        
        // When
        let api = PopularArticleAPIFactory.makeAPI(arguments: args)
        
        // Then
        XCTAssertTrue(api is MockPopularArticleAPI)
        let mock = api as! MockPopularArticleAPI
        XCTAssertEqual(mock.articleListCase, .successWithMultipleArticles)
    }
    
    func testFactoryReturnsMockWithNotFoundWhenErrorArgumentPresent() {
        // Given
        let args = ["-uitestcase_error"]
        
        // When
        let api = PopularArticleAPIFactory.makeAPI(arguments: args)
        
        // Then
        XCTAssertTrue(api is MockPopularArticleAPI)
        let mock = api as! MockPopularArticleAPI
        XCTAssertEqual(mock.articleListCase, .notFound)
    }
    
    func testFactoryReturnsMockWhenMockedArgumentPresent() {
        // Given
        let args = ["-mocked"]
        
        // When
        let api = PopularArticleAPIFactory.makeAPI(arguments: args)
        
        // Then
        XCTAssertTrue(api is MockPopularArticleAPI)
    }
    
    func testFactoryReturnsRealAPIWhenNoArguments() {
        // Given
        let args: [String] = []
        
        // When
        let api = PopularArticleAPIFactory.makeAPI(arguments: args)
        
        // Then
        XCTAssertTrue(api is PopularArticleAPI)
    }
}
