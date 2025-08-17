//
//  AppButtonStyle.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

enum AppButtonStyle {
    case primary
    case outline(color: Color)
    case danger
    // Similar we can add more styles
    
    var foregroundColor: Color {
        switch self {
        case .primary:
            return .white
        case .outline(color: let color):
            return color
        case .danger:
            return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return .blue
        case .outline:
            return .clear
        case .danger:
            return .red
        }
    }
    
    var font: Font {
        switch self {
        case .primary:
            return .system(size: 16, weight: .medium, design: .default)
        case .outline:
            return .system(size: 15, weight: .light, design: .default)
        case .danger:
            return .system(size: 17, weight: .bold, design: .default)
        }
    }
    
    var maxWidth: CGFloat? {
        switch self {
        case .primary, .danger:
            return .infinity
        case .outline:
            return nil
        }
    }
    
    var horizonalPadding: CGFloat {
        switch self {
        case .primary, .danger:
            return 16
        case .outline:
            return 10
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .primary, .danger, .outline:
            return 10
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary, .danger, .outline:
            return 8
        }
    }
    
    var strokeLineWidth: CGFloat {
        switch self {
        case .primary, .danger:
            return 0
        case .outline:
            return 1
        }
    }
}
