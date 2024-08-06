//
//  Toastswift.swift
//  Test
//
//  Created by Marek on 02/07/2024.
//

import SwiftUI

struct ToastView: View {
    var text: String
    var actionText: String
    var onAction: () -> Void
    var onClose: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.yellow)
                .accessibilityIdentifier("toastIcon")
            Text(text)
                .foregroundColor(.black)
                .accessibilityIdentifier("toastText")
            Spacer()
            Button(action: onAction) {
                Text(actionText)
                    .foregroundColor(.blue)
            }
            .accessibilityIdentifier("toastActionButton")
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
            .accessibilityIdentifier("toastCloseButton")
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
    }
}
