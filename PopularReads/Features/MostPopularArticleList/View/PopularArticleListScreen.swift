//
//  PopularArticleListScreen.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import SwiftUI

struct PopularArticleListScreen: View {
    @StateObject private var viewModel: PopularArticleViewModel
    
    init(api: PopularArticleAPIRepresentable) {
        _viewModel = .init(wrappedValue: .init(api: api))
    }

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.state {
                case .error(let message):
                    errorView(for: message)
                case .loading:
                    loadingView
                case .loaded(let articles):
                    articleListView(with: articles)
                default: EmptyView()
                }
            }
            .accessibilityIdentifier("mainContentainer")
            .task {
                await viewModel.loadArticles()
            }
            .navigationTitle("Most Popular Articles")
        }
        .accessibilityIdentifier("navigationStack")
    }
    
    func errorView(for message: String) -> some View {
        ErrorView(message: message) {
            Task {
                await viewModel.loadArticles()
            }
        }
    }
    var loadingView: some View {
        List(0..<6) { _ in
            SkeletonArticleRow()
        }
    }
    
    func articleListView(with articles: [Article]) -> some View {
        List(articles) { article in
            NavigationLink(destination: ArticleDetailView(article: article)) {
                ArticleRow(article: article)
            }
            .accessibilityIdentifier("articleRow_\(article.id)")
        }
        .accessibilityIdentifier("articleList")
    }
}

#Preview {
    PopularArticleListScreen(api: MockPopularArticleAPI.mocked)
}
