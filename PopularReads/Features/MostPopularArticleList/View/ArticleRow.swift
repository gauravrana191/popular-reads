//
//  ArticleRow.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Title
            AppText(text: article.title, style: .headline, lineLimit: 2)
                .accessibilityIdentifier("articleRowTitleText")
            
            // Byline + Date
            BylineAndDateView(kind: .list, article: article)
                .accessibilityIdentifier("articleRowBylineDateText")
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .accessibilityIdentifier("articleRow")
    }
}

#Preview {
    ArticleRow(article: Article.mocked)
}

