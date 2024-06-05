//
//  ContentView.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ItemListViewModel
    @StateObject var cartViewModel = CartViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            ItemsListView(viewModel: viewModel, cartViewModel: cartViewModel, selectedTab: $selectedTab)
                .tabItem {
                    Label("Shop", systemImage: "storefront")
                }.tag(0)

            ShoppingCartView()
                .environmentObject(cartViewModel)
                .tabItem {
                    Label(
                        "Shopping Cart",
                        systemImage: "cart"
                    )
                }
                .tag(1)
        }
    }
}

#Preview {
    MainView().environmentObject(ItemListViewModel())
}


struct ItemsListView: View {
    let viewModel: ItemListViewModel
    @StateObject var cartViewModel: CartViewModel
    @Binding var selectedTab: Int
    
    var body: some View {
        List {
            ForEach(viewModel.itemsVM) { itemVM in
                VStack {
                    HStack {
                        Image(itemVM.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(itemVM.title)
                                .font(.title)
                            Text("\(itemVM.priceString)")
//                                .foregroundStyle(.green)
                            Spacer()
                            
                        }
                        .padding()
                        Spacer()
                    }
                    HStack {
                        Button("Buy now") {
                            cartViewModel.addItem(itemVM)
                            selectedTab = 1
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundStyle(Color.white )
                        .tint(Color.green)
                        
                        Spacer()
                        Button(action: {
                            cartViewModel.doesContain(item: itemVM) ?
                            cartViewModel.removeItem(itemVM) :
                            cartViewModel.addItem(itemVM)
                        }, label: {
                            Text(cartViewModel.doesContain(item: itemVM) ? "Delete from the cart" : "Add to the cart")
                                
                        })
                        .buttonStyle(.borderedProminent)
                        .foregroundStyle(Color.white )
                        .tint(cartViewModel.doesContain(item: itemVM) ? Color.red: Color.green)
                    }
                }.padding()
            }
        }
        
    }
}
