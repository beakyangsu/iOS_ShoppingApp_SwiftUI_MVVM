//
//  SearchView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                TextField("Search For Furniture", text: $search)
                    .padding()
            }
            .background(Color.solSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Image(systemName: "camera")
                .padding()
                .foregroundStyle(.white)
                .background(Color.solRrimary)
                .clipShape(RoundedRectangle(cornerRadius: 12))

        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
