//
//  ActivityView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct ActivityHomeView: View {
    @Binding var selectedTab: Int
    @Binding var achievementsCount: Int
    @Binding var achievements: [Achievement]
    
    var completeAchievement: (UUID) -> Void
    var addAchievement: (String, Int, String, Date) -> Void
    
    @State private var selectedActivityTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("ACTIVITY")
                    .font(.largeTitle.bold())
                    .padding(.top, 90)
                
                Divider()
                
                Picker("", selection: $selectedActivityTab) {
                    Text("Main").tag(0)
                    Text("Achievements").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedActivityTab == 0 {
                    VStack(spacing: 20) {
                        NavigationLink(
                            destination: AddActivityView(
                                addAchievement: addAchievement,
                                completeAchievement: completeAchievement,
                                achievementsCount: $achievementsCount,
                                achievements: $achievements
                            )
                        ) {
                            Text("RECORD AN ACTIVITY")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            selectedTab = 1  // Navigate to Workouts tab
                        }) {
                            Text("FIND A WORKOUT")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                } else if selectedActivityTab == 1 {
                    AchievementsView(
                        achievementsCount: $achievementsCount,
                        achievements: $achievements,
                        completeAchievement: completeAchievement
                    )
                }
                
                Spacer()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.7, green: 0.3, blue: 0.1), Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Activity", displayMode: .inline)
        }
        .tint(.blue)
    }
}

struct ActivityHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityHomeView(
            selectedTab: .constant(2),
            achievementsCount: .constant(0),
            achievements: .constant([
                Achievement(activityType: "Running", duration: 30, location: "Outdoors", date: Date(), isCompleted: false),
                Achievement(activityType: "Yoga", duration: 60, location: "Home", date: Date().addingTimeInterval(-86400), isCompleted: false)
            ]),
            completeAchievement: { _ in },
            addAchievement: { _, _, _, _ in }
        )
    }
}








