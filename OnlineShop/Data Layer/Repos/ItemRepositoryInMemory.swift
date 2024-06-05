//
//  ItemRepositoryInMemory.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import Foundation

struct ItemRepositoryInMemory: ItemRepository {
    
    func getAllItems() -> [Item] {
        getTestItems()
    }
    
    private func getTestItems() -> [Item] {
        
        let item1 = Item(
            id: 1,
            title: "English B2",
            price: 50000.00,
            imageUrl: "b2")
        let item2 = Item(
            id: 2,
            title: "English C1",
            price: 55000.00,
            imageUrl: "c1")
        
        let item3 = Item(
            id: 3,
            title: "Blue T-shirt",
            price: 15000.00,
            imageUrl: "tshirt")
        
        return [item1, item2, item3]
        
    }
}
