//
//  AppText.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppText: View {
    let text: String
    let style: AppTextStyle
    let lineLimit: Int?
    
    init(text: String, style: AppTextStyle, lineLimit: Int? = nil) {
        self.text = text
        self.style = style
        self.lineLimit = lineLimit
    }
    
    var body: some View {
        Text(text)
            .appTextStyle(style, lineLimit: lineLimit)
    }
}

#Preview {
    AppText(text: "Test", style: .title, lineLimit: nil)
}
