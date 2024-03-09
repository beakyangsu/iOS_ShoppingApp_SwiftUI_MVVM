//
//  UIView+Extention.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import SwiftUI

extension View {
    func getSafeArea() ->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }

        return safeArea
    }
}
