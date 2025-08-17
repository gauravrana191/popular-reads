//
//  ArticleTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest
@testable import PopularReads

final class ArticleTests: XCTestCase {

    func testDecodeArticleWithMedia() throws {
        let json = """
        {
          "uri": "nyt://article/abc123",
          "url": "https://example.com/article",
          "id": 123456,
          "asset_id": 123456,
          "source": "The New York Times",
          "published_date": "2024-08-16",
          "updated": "2024-08-17",
          "section": "Technology",
          "title": "Exciting Tech News",
          "abstract": "An exciting update on technology.",
          "byline": "By John Doe",
          "media": [
            {
              "type": "image",
              "subtype": "photo",
              "caption": "A cool photo",
              "copyright": "NYT",
              "media-metadata": [
                {
                  "url": "https://example.com/thumb.jpg",
                  "format": "Standard Thumbnail",
                  "height": 75,
                  "width": 75
                },
                {
                  "url": "https://example.com/image.jpg",
                  "format": "mediumThreeByTwo440",
                  "height": 293,
                  "width": 440
                }
              ]
            }
          ]
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let article = try decoder.decode(Article.self, from: json)

        XCTAssertEqual(article.uri, "nyt://article/abc123")
        XCTAssertEqual(article.id, 123456)
        XCTAssertEqual(article.assetID, 123456)
        XCTAssertEqual(article.source, "The New York Times")
        XCTAssertEqual(article.title, "Exciting Tech News")
        XCTAssertEqual(article.media?.count, 1)

        XCTAssertEqual(article.thumbnailURL, "https://example.com/thumb.jpg")
        XCTAssertEqual(article.imageURL, "https://example.com/image.jpg")
    }

    func testDecodeArticleWithoutMedia() throws {
        let json = """
        {
          "uri": "nyt://article/abc123",
          "url": "https://example.com/article",
          "id": 123456,
          "asset_id": 123456,
          "source": "The New York Times",
          "published_date": "2024-08-16",
          "updated": "2024-08-17",
          "section": "Technology",
          "title": "Exciting Tech News",
          "abstract": "An exciting update on technology.",
          "byline": "By John Doe",
          "media": null
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let article = try decoder.decode(Article.self, from: json)

        XCTAssertNil(article.media)
        XCTAssertNil(article.thumbnailURL)
        XCTAssertNil(article.imageURL)
    }

    func testEquatable() {
        let article1 = Article(
            uri: "nyt://article/1",
            url: "https://example.com/1",
            id: 1,
            assetID: 1,
            source: "Source",
            publishedDate: "2024-08-16",
            updated: "2024-08-17",
            section: "Tech",
            title: "Title 1",
            abstract: "Abstract 1",
            byline: "By Author",
            media: nil
        )

        let article2 = Article(
            uri: "nyt://article/1",
            url: "https://example.com/1",
            id: 1,
            assetID: 1,
            source: "Source",
            publishedDate: "2024-08-16",
            updated: "2024-08-17",
            section: "Tech",
            title: "Title 1",
            abstract: "Abstract 1",
            byline: "By Author",
            media: nil
        )

        XCTAssertEqual(article1, article2)
    }

    func testNotEquatable() {
        let article1 = Article(
            uri: "nyt://article/1",
            url: "https://example.com/1",
            id: 1,
            assetID: 1,
            source: "Source",
            publishedDate: "2024-08-16",
            updated: "2024-08-17",
            section: "Tech",
            title: "Title 1",
            abstract: "Abstract 1",
            byline: "By Author",
            media: nil
        )

        let article2 = Article(
            uri: "nyt://article/2",
            url: "https://example.com/2",
            id: 2,
            assetID: 2,
            source: "Source 2",
            publishedDate: "2024-08-18",
            updated: "2024-08-19",
            section: "Tech",
            title: "Title 2",
            abstract: "Abstract 2",
            byline: "By Author 2",
            media: nil
        )

        XCTAssertNotEqual(article1, article2)
    }
}

