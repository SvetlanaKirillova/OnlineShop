//
//  ItemListViewModel.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import Foundation
import Combine

class ItemListViewModel: ObservableObject {
    
    @Published private(set) var itemsVM: [ItemViewModel] = []
    private let itemsRepo: ItemRepository
    
    init(repo: ItemRepository = ItemRepositoryInMemory()) {
        self.itemsRepo = repo
        itemsVM = itemsRepo.getAllItems().map { ItemViewModel(item: $0) }
        
    }
    
    
}
