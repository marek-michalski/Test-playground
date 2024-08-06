//
//  ContentView.swift
//  Test
//
//  Created by Marek on 02/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showToast = false

    var body: some View {
        ZStack {
            VStack {
                Button("Show Toast") {
                    showToast = true
                }
                .accessibilityIdentifier("showToastButton")
            }

            if showToast {
                VStack {
                    ToastView(
                        text: "Announcement text",
                        actionText: "Action",
                        onAction: {
                            print("Action tapped")
                            showToast = false
                        },
                        onClose: {
                            showToast = false
                        }
                    )
                    .accessibilityIdentifier("toastView")
                    Spacer()
                }
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.spring(), value: showToast)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
