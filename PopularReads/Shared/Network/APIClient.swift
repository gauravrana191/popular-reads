//
//  APIClient.swift
//  PopularReads
//
//  Created by gaurav kumar on 17/08/25.
//

import Foundation

final class APIClient {
    private let baseURL: URL
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(baseURL: String,
         session: URLSession = .shared,
         decoder: JSONDecoder = JSONDecoder()) {
        guard let url = URL(string: baseURL) else {
            fatalError("Invalid base URL: \(baseURL)")
        }
        self.baseURL = url
        self.session = session
        self.decoder = decoder
    }
    
    func send<T: APIRequest>(_ request: T) async throws -> T.Response {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        components?.path = request.path
        components?.queryItems = request.queryItems
        
        guard let url = components?.url else {
            throw AppError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw AppError.badResponse
        }
        
        do {
            return try decoder.decode(T.Response.self, from: data)
        } catch {
            throw AppError.decodingError
        }
    }
}
