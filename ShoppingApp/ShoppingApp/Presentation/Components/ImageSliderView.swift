//
//  ImageSliderView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 1
    var slides: [String] = ["1", "2", "3", "4", "5"] //image name

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    //.scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            //bottomLeading : 왼쪽아래에 horizontal로 생김
            HStack {
                ForEach(0..<slides.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color.solRrimary : Color.solSecondary)
                        .frame(width: 10, height: 10)

                }
            }.padding()
        }
        .padding()
        .onAppear(
            perform: {
                Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                    //last index, go to first index
                    if self.currentIndex + 1 == self.slides.count {
                        self.currentIndex  = 0
                    } else {
                        self.currentIndex += 1
                    }
                }
            }
            //5초에 한번씩 이미지가 바뀜
        )
    }
}

#Preview {
    ImageSliderView()
}
