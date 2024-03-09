//
//  CartProductView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack(spacing:20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .clipShape(RoundedRectangle(cornerRadius: 9))

            //좌 정렬, 아이템간 간격 5
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .bold()
                Text("$ \(product.price)")
                    .bold()

            }
            .padding()

            Spacer()

            Button {
                cartManager.removeFromCart(product: product)
            }label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .accessibilityIdentifier("remove Product \(product.name)")
            }
            .accessibilityIdentifier("remove Product \(product.name)")
        }
        .padding(.horizontal) // HStack padding
        .background(Color.solSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(width: .infinity, alignment: .leading)
        .padding() //clipShape view padding (HStack의 부모)
    }
}

#Preview {
    CartProductView(product: productList[3]).environmentObject(CartManager())
}
