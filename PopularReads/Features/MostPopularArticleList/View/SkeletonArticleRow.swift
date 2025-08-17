//
//  SkeletonArticleRow.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import SwiftUI

struct SkeletonArticleRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Title placeholder
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 20)
                .padding(.trailing, 100)

            ZStack(alignment: .topTrailing) {
                // Byline placeholder (simulating 2 lines)
                VStack(alignment: .leading, spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 14)
                        .padding(.trailing, 80)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 14)
                        .padding(.trailing, 140)
                }

                // Date placeholder
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 14, height: 14)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 14)
                }
            }
        }
        .padding(.vertical, 8)
        .redacted(reason: .placeholder)
    }
}

#Preview {
    SkeletonArticleRow()
}
