//
//  DailyChallengeView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import SwiftUI

struct DailyChallengeView: View {
    @State private var challengeAccepted = false

    var body: some View {
        VStack {
            Text("Today's Challenge")
                .font(.headline)
                .padding(.top, 20)

            Text("Complete 30 push-ups in 2 minutes!")
                .font(.subheadline)
                .padding()

            Button(action: {
                challengeAccepted.toggle()
            }) {
                Text(challengeAccepted ? "Challenge Accepted!" : "Accept Challenge")
                    .padding()
                    .background(challengeAccepted ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.9, green: 0.5, blue: 0.3))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

