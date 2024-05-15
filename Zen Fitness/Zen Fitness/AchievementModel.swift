//
//  AchievementModel.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 13/5/2024.
//

import Foundation

struct Achievement: Identifiable {
    let id = UUID()
    let activityType: String
    let duration: Int
    let location: String
    let date: Date
    var isCompleted: Bool
}


