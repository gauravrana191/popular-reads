//
//  ArticleRowUITests.swift
//  PopularReadsUITests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest

final class ArticleRowUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testDetailView() {
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
        
        XCTAssertTrue(detailView.staticTexts["detailArticleTitleText"].exists)
        XCTAssertTrue(detailView.staticTexts["bylineText"].exists)
        XCTAssertTrue(detailView.images["Calendar"].exists)
        XCTAssertTrue(detailView.staticTexts["dateText"].exists)
        XCTAssertTrue(detailView.staticTexts["detailArticleAstractText"].exists)
        XCTAssertTrue(detailView.buttons["detailArticleReadFullArticleButton"].exists)
    }
    
    func testTapArticleRow() {
        app.launchArguments.append("-uitestcase_loaded")
        app.launch()
        
        let articleList = app.collectionViews["mainContentainer"]
        XCTAssertTrue(articleList.waitForExistence(timeout: 5), "Article list should exist")
        
        let firstRow = articleList.cells.containing(NSPredicate(format: "identifier CONTAINS 'articleRow_'"))
            .element(boundBy: 0)
        firstRow.tap()
        
        // Check detail screen by a unique identifier
        let detailView = app.scrollViews["articleDetailView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 5), "Detail view should be visible after tapping a row")
        let readArticleButton = detailView.buttons["detailArticleReadFullArticleButton"]
        XCTAssertTrue(readArticleButton.exists)
        readArticleButton.tap()
    }
}
