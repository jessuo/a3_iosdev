//
//  WorkoutSummaryView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import SwiftUI

struct WorkoutSummaryView: View {
    let recentWorkouts = [
        ("Running", "30 mins"),
        ("Yoga", "45 mins"),
        ("Cycling", "60 mins")
    ]

    var body: some View {
        VStack {
            Text("Recent Workouts")
                .font(.headline)
                .padding(.top, 20)

            ForEach(recentWorkouts, id: \.0) { workout in
                HStack {
                    Text(workout.0)
                    Spacer()
                    Text(workout.1)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

