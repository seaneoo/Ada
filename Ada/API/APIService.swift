//
//  APIService.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

enum APIServiceError: Error {
    case url(error: String)
    case response(error: String)
    case decoding(error: String)
}

class APIService {
    let session: URLSession
    let decoder: JSONDecoder

    init(session: URLSession = .init(configuration: .default), decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func perform<T: Decodable>(for: T.Type, from string: String) async throws -> T {
        guard let url = URL(string: string) else {
            throw APIServiceError.url(error: "")
        }

        let (data, response) = try await session.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIServiceError.response(error: "")
        }

        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIServiceError.decoding(error: error.localizedDescription)
        }
    }
}
