//
//  AchievementsView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct AchievementsView: View {
    @Binding var achievementsCount: Int
    @Binding var achievements: [Achievement]
    
    var completeAchievement: (UUID) -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.7, green: 0.3, blue: 0.1), Color.black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            List(achievements.filter { !$0.isCompleted }) { achievement in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Activity Type: \(achievement.activityType)")
                        Text("Duration: \(achievement.duration) minutes")
                        Text("Location: \(achievement.location)")
                        Text("Date: \(achievement.date, formatter: dateFormatter)")
                    }
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Button(action: {
                        completeAchievement(achievement.id)
                    }) {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                }
                .padding(.horizontal)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
        }
        .navigationBarTitle("Achievements", displayMode: .inline)
        .onAppear {
            achievementsCount = achievements.filter { !$0.isCompleted }.count
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(
            achievementsCount: .constant(0),
            achievements: .constant([
                Achievement(activityType: "Running", duration: 30, location: "Outdoors", date: Date(), isCompleted: false),
                Achievement(activityType: "Yoga", duration: 60, location: "Home", date: Date().addingTimeInterval(-86400), isCompleted: false)
            ]),
            completeAchievement: { _ in }
        )
    }
}






