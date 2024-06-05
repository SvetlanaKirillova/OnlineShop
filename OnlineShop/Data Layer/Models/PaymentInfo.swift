//
//  PaymentInfo.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 05.06.2024.
//

import Foundation

struct PaymentInfo: Codable {
    
    let amount: Double
    let cardNumber: String
    let cardHolder: String
    
    enum CodingKeys: String, CodingKey {
        case amount
        case cardNumber = "card_number"
        case cardHolder = "card_holder"
    }
}
