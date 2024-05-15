//
//  AddActivityView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct AddActivityView: View {
    @State private var selectedActivity = "Select"
    @State private var selectedDate = Date()
    @State private var duration = 30.0
    @State private var isDoneButtonClicked = false
    
    var addAchievement: (String, Int, String, Date) -> Void
    var completeAchievement: (UUID) -> Void
    @Binding var achievementsCount: Int
    @Binding var achievements: [Achievement]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Activity")
                    .font(.title.bold())
                    .padding(5)
                
                Form {
                    Picker("Activity Type", selection: $selectedActivity) {
                        Text("Select").tag("Select")
                        Text("Weight Training").tag("Weight Training")
                        Text("Cardio").tag("Cardio")
                        Text("Basketball").tag("Basketball")
                        Text("Bouldering").tag("Bouldering")
                        Text("Football").tag("Football")
                        Text("Running").tag("Running")
                        Text("Tennis").tag("Tennis")
                        Text("Yoga").tag("Yoga")
                        Text("Other").tag("Other")
                    }
                    
                    DatePicker("Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    
                    Picker("Duration", selection: $duration) {
                        ForEach(Array(stride(from: 5, through: 120, by: 5)), id: \.self) { minute in
                            Text("\(minute) minutes").tag(Double(minute))
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(
                    destination: ActivitySummaryView(
                        selectedActivity: $selectedActivity,
                        selectedDate: $selectedDate,
                        duration: $duration,
                        selectedLocation: .constant(""),
                        achievementsCount: $achievementsCount,
                        achievements: $achievements,
                        addAchievement: addAchievement,
                        completeAchievement: completeAchievement
                    ),
                    isActive: $isDoneButtonClicked
                ) {
                    Button(action: {
                        isDoneButtonClicked = true
                    }) {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                    .padding()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(
            addAchievement: { _, _, _, _ in },
            completeAchievement: { _ in },
            achievementsCount: .constant(0),
            achievements: .constant([
                Achievement(activityType: "Running", duration: 30, location: "Outdoors", date: Date(), isCompleted: false),
                Achievement(activityType: "Yoga", duration: 60, location: "Home", date: Date().addingTimeInterval(-86400), isCompleted: false)
            ])
        )
    }
}





