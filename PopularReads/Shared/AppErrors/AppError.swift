//
//  AppError.swift
//  PopularReads
//
//  Created by gaurav kumar on 16/08/25.
//

import Foundation

enum AppError: Error, LocalizedError, Equatable {
    case invalidURL
    case networkError(Error)
    case badResponse
    case decodingError
    case notFound
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to connect to the server. Please try again later."
        case .networkError(let error):
            return "A network error occurred: \(error.localizedDescription)"
        case .badResponse:
            return "Received an unexpected response from the server"
        case .notFound:
            return "We couldn't find what you're looking for."
        case .unknown, .decodingError:
            return "Something went wrong. Please try again later."
        }
    }
    
    static func ==(lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
             (.badResponse, .badResponse),
             (.decodingError, .decodingError),
             (.notFound, .notFound),
             (.unknown, .unknown):
            return true
        case (.networkError(let lhsError), .networkError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
