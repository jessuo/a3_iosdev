//
//  StreakView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import SwiftUI

struct StreakView: View {
    @State private var streakCount = 5  // Example streak count

    var body: some View {
        VStack {
            Text("Current Streak")
                .font(.headline)
                .padding(.top, 20)

            Text("\(streakCount) Days")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Keep it up!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

