//
//  AppTextStyle.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

enum AppTextStyle {
    case title
    case headline
    case subheadline
    case body
    case footnote
    
    var font: Font {
        switch self {
        case .title:
            .title
        case .headline:
            .headline
        case .subheadline:
            .subheadline
        case .footnote:
            .footnote
        default:
            .body
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .title:
            .bold
        case .headline:
            .bold
        default:
            .regular
        }
    }
    
    var color: Color {
        switch self {
        case .title, .headline:
            return .primary
        default:
            return .secondary
        }
    }
}
