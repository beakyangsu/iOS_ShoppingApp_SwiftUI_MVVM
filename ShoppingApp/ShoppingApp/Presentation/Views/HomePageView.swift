//
//  HomePageView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManger: CartManager
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .ignoresSafeArea(edges: .all)
                ScrollView {
                    VStack {
                        AppBar().environmentObject(cartManger)
                        SearchView()
                        ImageSliderView()

                        HStack {
                            Text("New Rivals")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()


                            NavigationLink {
                                ProductsView().environmentObject(cartManger)
                            } label: {
                                Image(systemName: "circle.grid.2x2.fill")
                                    .foregroundStyle(Color.solRrimary)
                            }
                        }
                        .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(productList, id: \.id) { product in
                                    NavigationLink(destination: {
                                        ProductDetailView(product: product)
                                    }, label: {
                                        ProductCardView(product: product) .environmentObject(cartManger)
                                    })
                                    .accessibilityIdentifier("productDetail button \(product.name)")
                                }
                            }
                            .padding(.leading)
                            .padding(.trailing)
                        }

                    }.padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    HomePageView().environmentObject(CartManager())
}

struct AppBar: View {
    @EnvironmentObject var cartManger: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Text("Shanghai, China")
                        .font(.title2)
                        .foregroundStyle(Color.gray)

                    Spacer()

                    NavigationLink(destination: {
                        CartView().environmentObject(cartManger)
                    }, label: {
                        CartButton(numberOfProducts: cartManger.products.count)

                    })
                }
                Text("Find The Most \nLuxurios")
                    .font(.largeTitle.bold())

                //+를 붙여서 바로 옆에 이어서 뷰가 나오게함, 색을 다르게하려고 분리함
                + Text(" Furniture")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.solRrimary)

            }
        }
        .padding()
        //.environmentObject(CartManager())
        //NavigationStack 안으로 패딩을줌
    }
}
