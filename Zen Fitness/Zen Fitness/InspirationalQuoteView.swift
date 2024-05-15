//
//  InspirationalQuoteView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import SwiftUI

struct InspirationalQuoteView: View {
    let quotes = [
        "Believe you can and you're halfway there.",
        "The only bad workout is the one that didn’t happen.",
        "Sweat is just fat crying.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The body achieves what the mind believes."
    ]
    @State private var quote = ""

    var body: some View {
        VStack {
            Text("Inspirational Quote")
                .font(.headline)
                .padding(.top, 20)

            Text(quote)
                .font(.subheadline)
                .padding()
                .multilineTextAlignment(.center)

            Button(action: {
                quote = quotes.randomElement() ?? "Keep pushing forward!"
            }) {
                Text("Show Another")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .onAppear {
                quote = quotes.randomElement() ?? "Keep pushing forward!"
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.9, green: 0.5, blue: 0.3))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

