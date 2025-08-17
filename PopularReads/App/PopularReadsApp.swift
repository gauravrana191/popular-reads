//
//  PopularReadsApp.swift
//  PopularReads
//
//  Created by gaurav kumar on 15/08/25.
//

import SwiftUI

@main
struct PopularReadsApp: App {
    private let api: PopularArticleAPIRepresentable
    
    init() {
        let args = ProcessInfo.processInfo.arguments
        api = PopularArticleAPIFactory.makeAPI(arguments: args)
    }
    
    var body: some Scene {
        WindowGroup {
            PopularArticleListScreen(api: api)
        }
    }
}
