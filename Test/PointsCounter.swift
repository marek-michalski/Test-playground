//
//  PointsCounter.swift
//  Test
//
//  Created by Marek on 03/07/2024.
//

import SwiftUI

struct PointsCounter: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("GRACZE")
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                List {
                    ForEach(0..<4) { _ in
                        Text("Label")
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    // Action for Edit button
                }) {
                    Text("Edit")
                }
                Button(action: {
                    // Action for icon button
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                }
            })
        }
    }
}

#Preview {
    PointsCounter()
}
