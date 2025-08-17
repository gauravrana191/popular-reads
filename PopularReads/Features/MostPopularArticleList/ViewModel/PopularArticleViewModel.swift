//
//  PopularArticleViewModel.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

final class PopularArticleViewModel: ObservableObject {
    
    @Published private(set) var state: State = .initial
    let api: PopularArticleAPIRepresentable
    
    init(api: PopularArticleAPIRepresentable) {
        self.api = api
    }

    @MainActor
    func loadArticles() {
        self.state = .loading
        Task {
            do {
                let articles = try await self.api.fetchArticles()
                self.state = .loaded(articles)
            } catch let error as AppError {
                self.state = .error(error.localizedDescription)
            } catch {
                self.state = .error(AppError.unknown.localizedDescription)
            }
        }
    }
}

extension PopularArticleViewModel {
    enum State: Equatable {
        case initial
        case loading
        case loaded([Article])
        case error(String)
    }
}
