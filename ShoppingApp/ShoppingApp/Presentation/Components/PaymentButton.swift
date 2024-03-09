//
//  PaymentButton.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/08.
//

import SwiftUI
import PassKit

struct PaymentButton: View {
    var action : () -> Void

    var body: some View {
        Representable(action: action)
    }
}

#Preview {
    PaymentButton {}
        .frame(minWidth: 100, maxHeight: 400)
        .frame(height: 45)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
}

extension PaymentButton {
    struct Representable: UIViewRepresentable {
        var action : () -> Void

        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }

        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }

    class Coordinator: NSObject {
        var action : () -> Void
        var button = PKPaymentButton(paymentButtonType: .continue, paymentButtonStyle: .automatic)

        init(action: @escaping () -> Void) {
            self.action = action
            super.init()

            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }

        @objc private func callback(_ sender : Any) {
            action()
        }
    }
}
