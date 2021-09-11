//
//  NetworkManager.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 10.09.21.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func get<T: Codable>(model: T.Type, with url: String, completion: @escaping ((Result<T, Error>) -> Void))
}

final class NetworkManager: NetworkManagerProtocol {
    func get<T: Codable>(model: T.Type, with url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: URL(string: url)!) {data, response, error in
            do {
                let items = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(items))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
