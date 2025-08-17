//
//  AppButton.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppButton: View {
    let title: String
    let style: AppButtonStyle
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .appButtonStyle(style)
    }
}

#Preview {
    AppButton(title: "Continue", style: .primary) {
        print(">>> Action triggered <<<")
    }
}
