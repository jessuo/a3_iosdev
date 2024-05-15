//
//  TabView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var taskCount = 0
    @State private var achievementsCount = 0
    
    @State private var achievements: [Achievement] = [
        Achievement(activityType: "Running", duration: 30, location: "Outdoors", date: Date(), isCompleted: false),
        Achievement(activityType: "Yoga", duration: 60, location: "Home", date: Date().addingTimeInterval(-86400), isCompleted: false)
    ]
    
    func addAchievement(activityType: String, duration: Int, location: String, date: Date) {
        let newAchievement = Achievement(activityType: activityType, duration: duration, location: location, date: date, isCompleted: false)
        achievements.append(newAchievement)
        achievementsCount = achievements.filter { !$0.isCompleted }.count
    }
    
    func completeAchievement(id: UUID) {
        if let index = achievements.firstIndex(where: { $0.id == id }) {
            achievements[index].isCompleted = true
            achievementsCount = achievements.filter { !$0.isCompleted }.count
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(taskCount: $taskCount, achievementsCount: $achievementsCount)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            WorkoutsView(taskCount: $taskCount)
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workouts")
                }
                .tag(1)
            
            ActivityHomeView(
                selectedTab: $selectedTab,
                achievementsCount: $achievementsCount,
                achievements: $achievements,
                completeAchievement: completeAchievement,
                addAchievement: addAchievement
            )
            .tabItem {
                Image(systemName: "chart.bar.doc.horizontal")
                Text("Activity")
            }
            .tag(2)
        }
        .tint(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

















