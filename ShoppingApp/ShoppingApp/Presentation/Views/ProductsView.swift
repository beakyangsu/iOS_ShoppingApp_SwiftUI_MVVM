//
//  ProductsView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var cartManger: CartManager
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
   
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProductsView()
}
