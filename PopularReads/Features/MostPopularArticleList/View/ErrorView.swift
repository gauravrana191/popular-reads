//
//  ErrorView.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: () -> Void
    
    init(message: String, onRetry: @escaping () -> Void) {
        self.message = message
        self.onRetry = onRetry
    }

    var body: some View {
        VStack(spacing: 24) {
            // Generic error icon
            AppIcon(kind: .error)

            // Error message
            AppText(text: message, style: .body)
            
            // Try Again button
            AppButton(title: "Try Again", style: .outline(color: .blue), action: onRetry)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityIdentifier("errorView")
    }
}


#Preview {
    ErrorView(message: "Something went wrong!") {
        print(">>> Retrying...")
    }
}
