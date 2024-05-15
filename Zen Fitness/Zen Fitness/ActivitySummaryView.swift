//
//  ActivitySummaryView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI
import Foundation

struct ActivitySummaryView: View {
    @Binding var selectedActivity: String
    @Binding var selectedDate: Date
    @Binding var duration: Double
    @Binding var selectedLocation: String
    @Binding var achievementsCount: Int
    @Binding var achievements: [Achievement]
    
    var addAchievement: (String, Int, String, Date) -> Void
    var completeAchievement: (UUID) -> Void
    
    let locations = ["Home", "Gym", "Outdoors"]
    @State private var selectedLocationIndex = 0
    @State private var isRecordingActivity = false
    
    var body: some View {
        VStack {
            Text("\(selectedDate, formatter: dateFormatter)")
                .font(.title.bold())
                .padding()
            
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 350)
                    .cornerRadius(10)
                
                Text(selectedActivity)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(10)
            }
            .padding()
            
            Text("Duration: \(Int(duration)) minutes")
                .font(.title2.bold())
                .padding()
            
            Picker("Location", selection: $selectedLocationIndex) {
                ForEach(0..<locations.count) { index in
                    Text(locations[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(-10)
            
            Spacer()
            
            Button(action: {
                addAchievement(selectedActivity, Int(duration), locations[selectedLocationIndex], selectedDate)
                isRecordingActivity = true
            }) {
                Text("Record Activity")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding()
            .background(
                NavigationLink(
                    destination: AchievementsView(
                        achievementsCount: $achievementsCount,
                        achievements: $achievements,
                        completeAchievement: completeAchievement
                    ),
                    isActive: $isRecordingActivity
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
}

struct ActivitySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySummaryView(
            selectedActivity: .constant("Running"),
            selectedDate: .constant(Date()),
            duration: .constant(30.0),
            selectedLocation: .constant("Gym"),
            achievementsCount: .constant(0),
            achievements: .constant([
                Achievement(activityType: "Running", duration: 30, location: "Outdoors", date: Date(), isCompleted: false),
                Achievement(activityType: "Yoga", duration: 60, location: "Home", date: Date().addingTimeInterval(-86400), isCompleted: false)
            ]),
            addAchievement: { _, _, _, _ in },
            completeAchievement: { _ in }
        )
    }
}






