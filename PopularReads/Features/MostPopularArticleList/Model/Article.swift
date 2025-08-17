//
//  Article.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

struct Article: Codable, Identifiable, Equatable {
    let uri: String
    let url: String
    let id: Int
    let assetID: Int
    let source: String
    let publishedDate: String
    let updated: String
    let section: String
    let title: String
    let abstract: String
    let byline: String
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, title
        case abstract, byline, media
    }
}

// MARK: - Helpers
extension Article {
    var thumbnailURL: String? {
        media?.first?.mediaMetadata
            .first(where: { $0.format == "Standard Thumbnail" })?.url
    }

    var imageURL: String? {
        media?.first?.mediaMetadata
            .first(where: { $0.format == "mediumThreeByTwo440" })?.url
    }
}

// MARK: - Preview / Mock
extension Article {
    static let mocked = Article(
        uri: "nyt://article/123",
        url: "https://nytimes.com/2025/08/16/article.html",
        id: 123,
        assetID: 456,
        source: "New York Times",
        publishedDate: "2025-08-16",
        updated: "2025-08-16",
        section: "Technology",
        title: "SwiftUI Testing Best Practices",
        abstract: "A deep dive into writing better tests for SwiftUI applications.",
        byline: "By John Appleseed",
        media: [
            Media(
                type: "image",
                subtype: "photo",
                caption: "An image for testing",
                copyright: "NYT",
                mediaMetadata: [
                    MediaMetadata(url: "https://picsum.photos/100", format: "Standard Thumbnail", height: 75, width: 75),
                    MediaMetadata(url: "https://picsum.photos/440", format: "mediumThreeByTwo440", height: 293, width: 440)
                ]
            )
        ]
    )
}

