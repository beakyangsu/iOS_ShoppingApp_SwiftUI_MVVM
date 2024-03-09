//
//  CartView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManger: CartManager
    var body: some View {
        ScrollView {
            if !cartManger.products.isEmpty {
                ForEach(cartManger.products, id: \.id) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Text("Your Total is ")
                    Spacer()
                    Text("$\(cartManger.total).00")
                        .bold()
                }
                .padding()

                PaymentButton {

                }
                .padding()
            } else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle("My Cart")
        .padding(.top)
    }
}

#Preview {
    CartView().environmentObject(CartManager())
}
