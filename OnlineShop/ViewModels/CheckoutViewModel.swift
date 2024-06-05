//
//  CheckoutViewModel.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 05.06.2024.
//

import Foundation

struct PaymentResult {
    let result: Bool
    let message: String
}

class CheckoutViewModel: ObservableObject {
    let sum: Double
    @Published var holderName: String = ""
    @Published var cardNumber: String = ""
    @Published var showAlert = false
    @Published var paymentResult: PaymentResult?
    
    private let paymentService: PaymentService = PaymentServiceImpl()
    
    var sumString: String {
        String(format: "%.2f", sum)
    }
    
    
    init(sum: Double) {
        self.sum = sum
    }
    
    var cardInfoValid: Bool {
        return cardNumber.count == 19
//        && cardNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        && !holderName.isEmpty
    }
    
    func formatCardNumber(_ input: String) -> String {

        var formattedCardNumber = ""
        let cleanInput = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        for (index, char) in cleanInput.enumerated() {
            if index >= 16 {
                return formattedCardNumber
            }
            if index > 0 && index % 4 == 0 {
                formattedCardNumber += " "
            }
            formattedCardNumber.append(char)
        }
        
        return formattedCardNumber
    }
    
    func processPayment() {
        let payment = PaymentInfo(amount: sum, cardNumber: cardNumber, cardHolder: holderName)
        print(payment)
        if paymentService.processPayment(payment: payment) == .success {
            paymentResult = PaymentResult(result: true, message: "The payment was successful!")
        } else {
            paymentResult = PaymentResult(result: false, message: "Payment failed!")
        }
        showAlert = true
    }
}
