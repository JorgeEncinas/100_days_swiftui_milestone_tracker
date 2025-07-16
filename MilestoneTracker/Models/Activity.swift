//
//  Activity.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct Activity : Codable, Identifiable { //Codable to save it in UserDefaults, Hashable to save it in NavigationPath maybe?
    var id : UUID // Or perhaps use only the activity ID as a way to set the navPath?
    var name : String
    var activityColor : ActivityColor
    var description : String
    var amountDone : Int
    
    var baseIncrement : Int
    var unit : String
    
    init(name : String, activityColor: ActivityColor, description : String, amountDone: Int, baseIncrement : Int, unit: String) {
        self.id = UUID()
        self.name = name
        self.activityColor = activityColor
        self.description = description
        self.amountDone = amountDone
        self.baseIncrement = baseIncrement
        self.unit = unit
    }
}

