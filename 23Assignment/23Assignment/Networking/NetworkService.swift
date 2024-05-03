//
//  NetworkService.swift
//  23Assignment
//
//  Created by Sandro Gelashvili on 03.05.24.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class NetworkService {
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.decodeError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.wrongResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.wrongStatusCode(code: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.decodeError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
