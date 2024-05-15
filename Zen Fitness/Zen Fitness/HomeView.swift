//
//  ContentView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var taskCount: Int  // Bind to task count
    @Binding var achievementsCount: Int  // Bind to achievements count
    
    var body: some View {
        VStack {
            Text("Hello!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 80)  // Reduce top padding
            
            Spacer()  // Add a spacer to push content up
            
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("SUMMARY,")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Text("\(taskCount) WORKOUTS COMPLETED")  // Display task count
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.8, green: 0.4, blue: 0.2))
                    .cornerRadius(10)
                    
                    HStack {
                        Text("\(achievementsCount) ACHIEVEMENTS")  // Display achievements count
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.8, green: 0.4, blue: 0.2))
                    .cornerRadius(10)
                }
                .padding()
                .background(Color(red: 0.9, green: 0.5, blue: 0.3))
                .cornerRadius(15)
                
                // other features
                InspirationalQuoteView()
                DailyChallengeView()
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
            
            
            Spacer()
            
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.7, green: 0.3, blue: 0.1), Color.black]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(taskCount: .constant(0), achievementsCount: .constant(0))
    }
}







