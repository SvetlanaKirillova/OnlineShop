//
//  ItemRepository.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import Foundation

protocol ItemRepository {
    
    func getAllItems() -> [Item]
}
