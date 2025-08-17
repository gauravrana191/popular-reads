//
//  AppIcon.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import SwiftUI

struct AppIcon: View {
    
    let kind: Kind
    
    var body: some View {
        Image(systemName: kind.name)
            .font(.system(size: kind.size))
            .foregroundStyle(kind.foregroundColor)
    }
}

extension AppIcon {
    enum Kind {
        case calendar
        case error
        
        var name: String {
            switch self {
            case .calendar:
                return "calendar"
            case .error:
                return "exclamationmark.circle"
            }
        }
        
        var size: CGFloat {
            switch self {
            case .calendar:
                return 16
            case .error:
                return 60
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .calendar:
                return .secondary
            case .error:
                return .gray
            }
        }
    }
}
