//
//  PopularArticleListScreenUITests.swift
//  PopularReadsUITests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest

final class PopularArticleListScreenUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    // MARK: - Loaded State
    
    func testArticleListDisplaysArticles() {
        app.launchArguments.append("-uitestcase_loaded")
        app.launch()
        
        let articleList = app.collectionViews["mainContentainer"]
        XCTAssertTrue(articleList.waitForExistence(timeout: 5), "Article list should exist")
        
        let predicate = NSPredicate(format: "identifier CONTAINS 'articleRow_'")
        let cells = articleList.cells.containing(predicate)
        XCTAssertTrue(cells.count >= 4, "At least 4 article rows should exist")
    }
    
    // MARK: - Navigation
    
    func testTapArticleRowNavigatesToDetail() {
        app.launchArguments.append("-uitestcase_loaded")
        app.launch()
        
        let articleList = app.collectionViews["mainContentainer"]
        XCTAssertTrue(articleList.waitForExistence(timeout: 5), "Article list should exist")
        
        let firstRow = articleList.cells.containing(NSPredicate(format: "identifier CONTAINS 'articleRow_'"))
            .element(boundBy: 0)
        XCTAssertTrue(firstRow.waitForExistence(timeout: 3), "First article row should exist")
        
        firstRow.tap()
        
        // Check detail screen by a unique identifier
        let detailView = app.scrollViews["articleDetailView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 5), "Detail view should be visible after tapping a row")
    }
    
    // MARK: - Error State
    
    func testErrorStateDisplaysErrorView() { app.launchArguments.append("-uitestcase_error")
        app.launch()
        
        // Assert error icon exists
        let errorIcon = app.images["Error"]
        XCTAssertTrue(errorIcon.waitForExistence(timeout: 5), "Error image should exist")
        
        // Assert message exists
        let errorMessage = app.staticTexts["We couldn't find what you're looking for."]
        XCTAssertTrue(errorMessage.exists)
        
        // Assert retry button exists
        let retryButton = app.buttons["Try Again"]
        XCTAssertTrue(retryButton.exists)
    }
}
