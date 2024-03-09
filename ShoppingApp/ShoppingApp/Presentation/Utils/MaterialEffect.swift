//
//  MaterialEffect.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import SwiftUI

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }


}
