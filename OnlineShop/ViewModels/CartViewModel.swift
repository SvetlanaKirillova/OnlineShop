//
//  CartViewModel.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 05.06.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var itemsInCart: [ItemViewModel] = []
    @Published var totalSum: Double = 0.0
    
    var total: String {
        String(format: "%.2f", totalSum)
    }
    func addItem(_ item: ItemViewModel) {
        if doesContain(item: item) {
            return
        }
        
        itemsInCart.append(item)
        totalSum += item.price
        print("New item added to the cart: \(itemsInCart.count)")
    }
    
    func removeItem(_ item: ItemViewModel) {
        itemsInCart.removeAll(where: { $0.id == item.id })
        totalSum -= item.price
    }
    
    func removeAllItems() {
        itemsInCart.removeAll()
        totalSum = 0.0
    }
    
    func doesContain(item: ItemViewModel) -> Bool {
        itemsInCart.contains(where: { $0.id == item.id })
    }
}
