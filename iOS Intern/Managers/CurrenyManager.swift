//
//  CurrenyManager.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 10.09.21.
//

import UIKit

class CurrencyManager {
    
    private var networkManager: NetworkManager = NetworkManager()
        
    func getCurrency(completion: @escaping ([CurrencyModel]) -> Void) {
        networkManager.get(model: [Response].self, with: Endpoints.currenciesEndpoint) { result in
            switch result {
            case .success(let response):
                let newCurrencies = response.first!.currencies.map { CurrencyModel(with: $0) }
                completion(newCurrencies)
            case .failure(let error):
                print("Error is \(error)")
            }
        }
    }
}
