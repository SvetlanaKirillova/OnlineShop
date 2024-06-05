//
//  ItemViewModel.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject, Identifiable {
    
    private let item: Item
    
    var id: Int {
        item.id
    }
    var title: String {
        item.title
    }
    var price: Double {
        item.price
    }
    var priceString: String {
        String(format: "%.2f", item.price)
    }
    var imageURL: String {
        item.imageUrl
    }
    
    init(item: Item) {
        self.item = item
    }
}
