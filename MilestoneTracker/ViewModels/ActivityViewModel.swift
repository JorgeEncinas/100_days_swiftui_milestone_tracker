//
//  ActivityViewModel.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/18/25.
//
import SwiftUI

typealias AddOrEditActivityFunc = (_ activity : Activity) -> Void

class ActivityViewModel : ObservableObject {
    @Published var activities = [UUID : Activity]()
    
    func incrementCount(id : UUID, increment : Bool) -> Void {
        if var activity = activities[id] {
            if increment {
                activity.amountDone += activity.baseIncrement
            } else {
                activity.amountDone -= activity.baseIncrement
            }
            activities[id] = activity
            saveActivities()
        }
    }
    
    func addOrEditActivity(activity : Activity) -> Void {
        activities[activity.id] = activity
        saveActivities()
    }
    
    private func saveActivities() {
        DataManager.save(file: "activities.json", contents: activities)
    }
    
    init() {
        if let activities = DataManager.load([UUID : Activity].self, from: "activities.json") {
            self.activities = activities
        } else {
            self.activities = [UUID : Activity]()
        }
    }
}
