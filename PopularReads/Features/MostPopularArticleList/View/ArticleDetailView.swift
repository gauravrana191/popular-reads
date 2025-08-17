//
//  ArticleDetailView.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.openURL) private var openURL
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image
                AppAsyncImage(imageURL: article.imageURL)
                // Title
                AppText(text: article.title, style: .title)
                    .accessibilityIdentifier("detailArticleTitleText")

                // Byline & Date
                BylineAndDateView(kind: .detail, article: article)

                // Abstract
                AppText(text: article.abstract, style: .body)
                    .padding(.top, 8)
                    .accessibilityIdentifier("detailArticleAstractText")

                // Read Full Article Button
                if let url = URL(string: article.url) {
                    AppButton(title: "Read Full Article", style: .primary) {
                        openURL(url)
                    }
                    .padding(.top, 16)
                    .accessibilityIdentifier("detailArticleReadFullArticleButton")
                }

                Spacer()
            }
            .padding()
        }
        .accessibilityIdentifier("articleDetailView")
        .navigationTitle("Article")
    }
}


#Preview {
    ArticleDetailView(article: .mocked)
}
