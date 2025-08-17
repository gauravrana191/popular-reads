//
//  ArticleResponse.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [Article]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct Media: Codable, Equatable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable, Equatable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}

extension ArticleResponse {
    static var mocked: ArticleResponse {
        .init(
            status: "OK",
            copyright: "Copyright (c) 2021 The New York Times Company. All Rights Reserved.",
            numResults: 1,
            results: [Article.mocked]
        )
    }
}
