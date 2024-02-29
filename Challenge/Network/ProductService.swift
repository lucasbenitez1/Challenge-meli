//
//  ProductService.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//

import Foundation
class ProductService {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(productsResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case unknown
}
