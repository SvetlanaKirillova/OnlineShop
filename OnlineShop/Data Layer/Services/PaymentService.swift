//
//  Services.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 05.06.2024.
//

import Foundation

enum ServerPaymentResponse {
    case error
    case success
}

protocol PaymentService {
    
    func processPayment(payment: PaymentInfo) -> ServerPaymentResponse
}

class PaymentServiceImpl: PaymentService {
    var paymentNumber = 0
    
    func processPayment(payment: PaymentInfo) -> ServerPaymentResponse {
    // TODO: Perform payment process request to backend, for now just mocking
        paymentNumber += 1
        if paymentNumber % 2 == 0 {
            return .success
        } 
        return .error
    }

}
