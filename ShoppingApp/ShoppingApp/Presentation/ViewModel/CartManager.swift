//
//  CutManager.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import Foundation

protocol CartProtocal {
    func addToCart(product: Product)
    func removeFromCart(product: Product)
}

class CartManager: ObservableObject, CartProtocal {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
