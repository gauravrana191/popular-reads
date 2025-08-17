//
//  AppTextModifier.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppTextModifier: ViewModifier {
    let style: AppTextStyle
    let lineLimit: Int?
    
    func body(content: Content) -> some View {
        content
            .font(style.font)
            .fontWeight(style.weight)
            .foregroundStyle(style.color)
            .lineLimit(lineLimit)
            .multilineTextAlignment(.leading)
    }
}
