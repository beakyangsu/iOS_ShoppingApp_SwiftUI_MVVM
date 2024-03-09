//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var body: some View {
        ScrollView {
            ZStack {
                Color.white

                VStack(alignment: .leading) {
                    //product image
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .frame(height: 300)

                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }


                    VStack(alignment : .leading) {
                        //product info
                        HStack {
                            Text(product.name)
                                .font(.title2.bold())
                            Spacer()
                            Text("$\(product.price).00")
                                .font(.title2)
                                .fontWeight(.medium)
                                .padding(.horizontal)
                                .background(Color.solSecondary)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.vertical)

                        //rating starts
                        HStack {
                            HStack(spacing: 10) {
                                ForEach(0..<5){ index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(Color.yellow)
                                }
                                Text("(4.5)")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)

                            Spacer()
                            HStack {
                                Button{

                                } label: {
                                    Image(systemName: "minus.square")
                                }
                                Text("1")
                                Button{

                                } label: {
                                    Image(systemName: "plus.square.fill")
                                        .foregroundStyle(Color.solRrimary)
                                }
                            }
                        }


                        //product description
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)
                        Text(product.description)

                        Spacer()

                        HStack(alignment: .top) {
                            //product size
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Text("Height: \(product.height)")
                                    .foregroundStyle(.gray)
                                Text("Width: \(product.width)")
                                    .foregroundStyle(.gray)
                                Text("Diameter: \(product.diameter)")
                                    .foregroundStyle(.gray)

                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Spacer()

                            VStack(alignment: .leading) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                HStack {
                                    ColorDotView(color:.blue)
                                    ColorDotView(color:.black)
                                    ColorDotView(color:.green)
                                }
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        }
                        .padding(.vertical)

                        PaymentButton {

                        }
                        .frame(width: .infinity, height: 35)
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .offset(y: -30) //이걸해서 이미지랑 겹쳐짐
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProductDetailView(product: productList[4])
}


struct ColorDotView: View {
    let color: Color

    var body: some View {
        color
            .frame(width:25, height: 25)
            .clipShape(Circle())
    }
}
