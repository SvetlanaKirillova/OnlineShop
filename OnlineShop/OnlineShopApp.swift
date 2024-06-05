//
//  OnlineShopApp.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import SwiftUI

@main
struct OnlineShopApp: App {
    
    let viewModel = ItemListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView().environmentObject(viewModel)
            }
            
        }
    }
}
