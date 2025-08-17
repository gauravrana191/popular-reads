//
//  ViewExtensions.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

extension View {
    func appButtonStyle(_ style: AppButtonStyle) -> some View {
        modifier(AppButtonModifier(style: style))
    }
}

extension View {
    func appTextStyle(_ style: AppTextStyle, lineLimit: Int? = nil) -> some View {
        modifier(AppTextModifier(style: style, lineLimit: lineLimit))
    }
}
