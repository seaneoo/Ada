//
//  APIService.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

class APIService {
    let session: URLSession
    let decoder: JSONDecoder

    init(session: URLSession = .init(configuration: .default), decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func perform<T: Decodable>(for: T.Type, from string: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: string) else {
            completion(.failure(APIServiceError.url(error: "Malformed URL (URL=\(string))")))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, (200 ... 299).contains(response.statusCode) else {
                completion(.failure(APIServiceError.response(error: "Invalid response status code")))
                return
            }

            if let error = error {
                completion(.failure(APIServiceError.response(error: error.localizedDescription)))
            }

            if let data = data {
                do {
                    self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decoded = try self.decoder.decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(APIServiceError.decoding(error: error.localizedDescription)))
                }
            }
        }.resume()
    }
}

extension APIService {
    enum APIServiceError: Error {
        case url(error: String)
        case response(error: String)
        case decoding(error: String)
    }
}
