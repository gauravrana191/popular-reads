//
//  AppAsyncImage.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppAsyncImage: View {
    let imageURL: String?
    
    var body: some View {
        // Image (if available)
        if let imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .overlay(
                        ProgressView()
                    )
            }
            .cornerRadius(12)
        }
    }
}

#Preview {
    AppAsyncImage(imageURL: nil)
}
