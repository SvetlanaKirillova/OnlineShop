//
//  CheckoutView.swift
//  OnlineShop
//
//  Created by Svetlana Kirillova on 05.06.2024.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: CheckoutViewModel
    @EnvironmentObject var cartViewMode: CartViewModel
    
    var body: some View {
        VStack {
            Form {
                List {
                    Section("Amount to pay") {

                        Text("\(viewModel.sumString)")
                            
                    }
                    Section("Card information") {
                        TextField("CARD HOLDER", text: $viewModel.holderName )
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.characters)
                            .padding()
                        TextField("---- ---- ---- ----", text: $viewModel.cardNumber)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding()
                            .onChange(of: viewModel.cardNumber, { oldValue, newValue in
                                viewModel.cardNumber = viewModel.formatCardNumber(newValue)
                            })
           
                    }
                }
                
            }
            Button("Confirm") {
                viewModel.processPayment()
            }
            .padding()
            .disabled(!viewModel.cardInfoValid)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Payment result"),
                message: Text(viewModel.paymentResult?.message ?? ""),
                dismissButton: .default(Text("OK")) {
                    if viewModel.paymentResult?.result == true {
                        viewModel.showAlert = false
                        cartViewMode.removeAllItems()
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        viewModel.showAlert = false
                    }
                    
                    
                }
            )
        }
        .navigationTitle("Payment")
    }
}

#Preview {
    let vm = CheckoutViewModel(sum: 50.0)
    return CheckoutView().environmentObject(vm)
}
