//
//  NetworkManager.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let productsUrlString = "https://dummyjson.com/products"
    
    private init() {}
    
    // MARK: - Fetch products
    func fetchProducts(completion: @escaping (Result<[Product]?, Error>) -> Void) {
        
        let url = URL(string: productsUrlString)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NSError()))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(Sasass.self, from: data)
                completion(.success(productsResponse.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



































