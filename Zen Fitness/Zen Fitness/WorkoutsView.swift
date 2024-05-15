//
//  WorkoutsView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct WorkoutsView: View {
    @Binding var taskCount: Int  // Bind to task count
    
    var body: some View {
        NavigationView {
            VStack {
                Text("WORKOUTS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 90)
                
                Text("WHATS NEW?")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                
                VStack(spacing: 50) {
                    HStack(spacing: 50) {
                        WorkoutCard(imageName: "workout1", title: "Balancing with KG", destination: BalancingWithKyleView(taskCount: $taskCount))
                        WorkoutCard(imageName: "workout2", title: "Yoga with Jonah", destination: YogaWithNoahView(taskCount: $taskCount))
                    }
                    
                    HStack(spacing: 50) {
                        WorkoutCard(imageName: "workout3", title: "Stomachs with Tara", destination: StomachsWithJudyView(taskCount: $taskCount))
                        WorkoutCard(imageName: "workout4", title: "Push ups with Traci", destination: PushUpsWithTraciView(taskCount: $taskCount))
                    }
                }
                .padding(.horizontal, 60)
                .padding(.bottom, 200)
                
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.7, green: 0.3, blue: 0.1), Color.black]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
        .tint(.blue)  // Change this color to your desired original color
    }
}

struct WorkoutCard<Destination: View>: View {
    let imageName: String
    let title: String
    let destination: Destination
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(10)
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            NavigationLink(destination: destination) {
                Text("Learn More")
                    .padding(5)
                    .background(Color.gray.opacity(0.7))
                    .cornerRadius(5)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 150)  // Ensures consistent card size
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView(taskCount: .constant(0))
    }
}












