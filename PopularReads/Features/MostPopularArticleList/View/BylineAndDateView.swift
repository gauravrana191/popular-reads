//
//  BylineAndDateView.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct BylineAndDateView: View {
    
    let kind: Kind
    let article: Article
    
    var body: some View {
        switch kind {
        case .list:
            rowView
        case .detail:
            columnView
        }
    }
    
    private var rowView: some View {
        HStack(alignment: .center, spacing: 8) {
            bylineText
            Spacer()
            dateView
        }
    }
    
    private var columnView: some View {
        VStack(alignment: .leading, spacing: 4) {
            bylineText
            dateView
        }
    }
    
    private var bylineText: some View {
        Group {
            if !article.byline.isEmpty {
                AppText(text: article.byline, style: .subheadline)
                    .accessibilityIdentifier("bylineText")
            }
        }
    }
    
    private var dateView: some View {
        HStack(spacing: 4) {
            AppIcon(kind: .calendar)
            AppText(text: article.publishedDate, style: .footnote)
                .accessibilityIdentifier("dateText")
        }
    }
}

#Preview {
    BylineAndDateView(kind: .list, article: .mocked)
}

extension BylineAndDateView {
    enum Kind {
        case detail
        case list
    }
}
