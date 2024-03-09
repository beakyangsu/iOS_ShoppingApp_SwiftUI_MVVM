//
//  Product.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import Foundation

struct Product : Identifiable {
    let id = UUID()
    var name : String
    var image : String
    var description : String
    var supplier : String
    var price : Int
    var width: String
    var height: String
    var diameter: String
}

var productList = [
    Product(name: "Couch", image: "1", description: "Leather", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Nice Couch", image: "2", description: "Nice", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Beautiful Couch", image: "3", description: "Beautiful", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "OutDoor Couch", image: "4", description: "OutDoor", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
    Product(name: "Green", image: "5", description: "Green", supplier: "IKEA", price: 350, width: "200 cm", height: "135 cm", diameter: "105 cm"),
]
