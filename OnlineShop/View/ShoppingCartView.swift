//
//  ShoppingCartView.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 04.06.2024.
//

import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var goToCheckout = false
    
    var body: some View {
        Form {
            List {
                Section("Items to buy") {

                    ForEach(cartViewModel.itemsInCart) { itemVM in
                        HStack {
                            Text(itemVM.title)
                            Spacer()
                            Text(itemVM.priceString)
                                .padding(.trailing, 5)
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                                .onTapGesture {
                                    cartViewModel.removeItem(itemVM)
                                }
                        }.padding()
                    }
                }
            }
            Section("Payment") {
                HStack {
                    Text("Sum to pay: ")
                    Spacer()
                    Text(cartViewModel.total)
                }
                let checkoutVM = CheckoutViewModel(sum: cartViewModel.totalSum)
                
                NavigationLink(destination: CheckoutView()
                    .environmentObject(checkoutVM)
                    .environmentObject(cartViewModel)
                ) {
                    Text("Checkout")
                        .foregroundStyle(Color.cyan)
                }
                .foregroundStyle(.blue)
                .disabled(cartViewModel.itemsInCart.isEmpty)
                
            }
            
        }
        .navigationTitle("Shopping Cart")
    }
}

#Preview {
    var viewModel = CartViewModel()
    viewModel.addItem(ItemViewModel(item: Item(id: 1, title: "Coffee", price: 5.5, imageUrl: "")))
    viewModel.addItem(ItemViewModel(item: Item(id: 2, title: "Croissant", price: 4, imageUrl: "")))
    return ShoppingCartView().environmentObject(viewModel)
//    return ShoppingCartView(cartViewModel: viewModel)
}
