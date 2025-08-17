//
//  AppButtonModifier.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppButtonModifier: ViewModifier {
    let style: AppButtonStyle
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, style.horizonalPadding)
            .padding(.vertical, style.verticalPadding)
            .frame(maxWidth: style.maxWidth)
            .font(style.font)
            .foregroundStyle(style.foregroundColor)
            .background(RoundedRectangle(cornerRadius: style.cornerRadius).fill(style.backgroundColor))
            .overlay {
                RoundedRectangle(cornerRadius: style.cornerRadius).stroke(style.foregroundColor, lineWidth: style.strokeLineWidth)
            }
    }
}
