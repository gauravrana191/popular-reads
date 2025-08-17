//
//  JSONLoaderTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest
@testable import PopularReads

final class JSONLoaderTests: XCTestCase {

    var loader: JSONLoader!

    override func setUp() {
        super.setUp()
        loader = JSONLoader(bundle: Bundle.main)
    }

    func testLoadValidArticles() {
        let response: ArticleResponse? = loader.load(filename: "single-article", type: ArticleResponse.self)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.results.first?.title, "Trump Directs Military to Target Foreign Drug Cartels")
    }
    
    func testLoadInvalidResult() {
        let response: ArticleResponse? = loader.load(filename: "decoding-error", type: ArticleResponse.self)
        XCTAssertNil(response)
    }

    func testLoadFileNotFound() {
        let article: Article? = loader.load(filename: "non-existent-file", type: Article.self)
        XCTAssertNil(article)
    }

    func testLoadMalformedJSONFails() {
        let malformedLoader = JSONLoader(bundle: Bundle(for: Self.self))
        let result: Article? = malformedLoader.load(filename: "malformed", type: Article.self)
        XCTAssertNil(result)
    }
    
    func testLoadSampleArticle() {
        let result: Article? = loader.load(filename: "sample-article", type: Article.self)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.title, "Exciting Tech News")
    }
}
