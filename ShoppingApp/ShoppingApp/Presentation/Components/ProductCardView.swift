//
//  ProductCardView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct ProductCardView: View {
// 부모뷰에서 자식뷰로 .environmentObject()로 주입
//@StateObject 와 바인딩되어 서로 값변경에 영향받는 오브젝트 @EnvironmentObject

    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        ZStack {
            Color.solSecondary//컬러뷰생김
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                    Text(product.name)
                        .font(.headline)
                        .padding(.vertical, 1)
                        .foregroundStyle(.black)

                    Text(product.supplier)
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                        .padding(.vertical, 0.5)

                    Text("$ \(product.price)")
                        .bold()
                        .foregroundStyle(.black)
                }
                Button{
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable() //이걸해야 frame이먹음
                        .foregroundStyle(Color.solRrimary)
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                        .accessibilityIdentifier("add button \(product.name)")
                }

            }

        }
        .frame(width: 185, height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProductCardView(product: productList[2]).environmentObject(CartManager())
}
