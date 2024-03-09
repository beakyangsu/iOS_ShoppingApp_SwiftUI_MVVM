//
//  CartButton.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .padding(5)
                .foregroundStyle(Color.black)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundStyle(Color.white)
                    .frame(width: 15, height: 15)
                    .background(Color.green)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 1)
}
