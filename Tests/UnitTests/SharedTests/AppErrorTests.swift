//
//  AppErrorTests.swift
//  PopularReadsTests
//
//  Created by gaurav kumar on 16/08/25.
//

import XCTest
@testable import PopularReads

final class AppErrorTests: XCTestCase {

    func testErrorDescription() {
        XCTAssertEqual(AppError.invalidURL.localizedDescription, "Unable to connect to the server. Please try again later.")
        XCTAssertEqual(AppError.badResponse.localizedDescription, "Received an unexpected response from the server")
        XCTAssertEqual(AppError.notFound.localizedDescription, "We couldn't find what you're looking for.")
        XCTAssertEqual(AppError.unknown.localizedDescription, "Something went wrong. Please try again later.")
        XCTAssertEqual(AppError.decodingError.localizedDescription, "Something went wrong. Please try again later.")

        let underlyingError = NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock network error"])
        let networkError = AppError.networkError(underlyingError)
        XCTAssertEqual(networkError.localizedDescription, "A network error occurred: Mock network error")
    }

    func testEqualitySimpleCases() {
        XCTAssertEqual(AppError.invalidURL, AppError.invalidURL)
        XCTAssertEqual(AppError.badResponse, AppError.badResponse)
        XCTAssertEqual(AppError.decodingError, AppError.decodingError)
        XCTAssertEqual(AppError.notFound, AppError.notFound)
        XCTAssertEqual(AppError.unknown, AppError.unknown)
        
        XCTAssertNotEqual(AppError.invalidURL, AppError.notFound)
        XCTAssertNotEqual(AppError.badResponse, AppError.decodingError)
    }

    func testEqualityNetworkErrorSameDescription() {
        let error1 = NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Timeout"])
        let error2 = NSError(domain: "Other", code: 2, userInfo: [NSLocalizedDescriptionKey: "Timeout"])
        
        let appError1 = AppError.networkError(error1)
        let appError2 = AppError.networkError(error2)
        
        XCTAssertEqual(appError1, appError2) // Same description
    }

    func testEqualityNetworkErrorDifferentDescription() {
        let error1 = NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Timeout"])
        let error2 = NSError(domain: "Other", code: 2, userInfo: [NSLocalizedDescriptionKey: "Connection lost"])
        
        let appError1 = AppError.networkError(error1)
        let appError2 = AppError.networkError(error2)
        
        XCTAssertNotEqual(appError1, appError2)
    }

    func testPatternMatching() {
        let error: AppError = .notFound

        switch error {
        case .notFound:
            XCTAssertTrue(true)
        default:
            XCTFail("Expected .notFound")
        }
    }
}
