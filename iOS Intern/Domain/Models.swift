//
//  Models.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 10.09.21.
//

import UIKit


struct Currency: Codable {
    var code: String?
    var name: String?
    var quantity: Int?
    var rate: Double?
    var validFromDate: String?
}

struct Response: Codable {
    var currencies: [Currency]
}

struct CurrencyModel {
    private var currency: Currency!
    
    var priceOf1Gel: Double {
        guard let rate = currency.rate else { return 0 }
        guard let quantity = currency.quantity else { return 0 }
        return round((rate / Double(quantity)) * 10_000) / 10_000
    }
    
    var code: String {
        currency.code ?? "No Code"
    }
    
    var name: String {
        currency.name ?? "No Name"
    }
    
    var date: String {
        guard let date = currency.validFromDate else { return "No Date" }
        return String(date.prefix(10))
    }
    
    init(with currency: Currency) {
        self.currency = currency
    }
}
