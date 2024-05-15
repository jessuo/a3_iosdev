//
//  WaterIntakeView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import SwiftUI

struct WaterIntakeView: View {
    @State private var waterIntake = 0

    var body: some View {
        VStack {
            Text("Water Intake")
                .font(.headline)
                .padding(.top, 20)

            Text("\(waterIntake) / 8 Glasses")
                .font(.subheadline)
                .padding()

            Button(action: {
                if waterIntake < 8 {
                    waterIntake += 1
                }
            }) {
                Text("Log Water")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

