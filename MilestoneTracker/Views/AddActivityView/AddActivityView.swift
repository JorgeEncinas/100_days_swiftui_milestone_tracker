//
//  AddActivityView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct AddActivityView : View {
    var id : UUID?
    let addOrEditActivity : AddOrEditActivityFunc
    @Environment(\.dismiss) var dismiss
    @State private var name : String = ""
    @State private var chosenColor : Color = Color.purple
    @State private var description : String = ""
    @State private var amountDone : Int = 0
    @State private var baseIncrement : Int = 1
    @State private var unit : String = "times"
    @State private var lightText : Bool = false
    
    init(activity : Activity, addOrEditActivity: @escaping AddOrEditActivityFunc) {
        self.id = activity.id
        self.name = activity.name
        self.description = activity.description
        self.chosenColor = activity.activityColor.color
        self.description = activity.description
        self.amountDone = activity.amountDone
        self.baseIncrement = activity.baseIncrement
        self.unit = activity.unit
        self.lightText = activity.activityColor.lightText
        
        self.addOrEditActivity = addOrEditActivity
    }
    
    init(addOrEditActivity: @escaping AddOrEditActivityFunc) {
        self.id = UUID()
        self.addOrEditActivity = addOrEditActivity
    }
    
    var mockActivity : Activity {
        let activityColor = ActivityColor(
            color: chosenColor,
            lightText: lightText
        )
        return Activity(
            name: name.isEmpty ? "Example" : name,
            activityColor: activityColor,
            description: description,
            amountDone: amountDone,
            baseIncrement : baseIncrement,
            unit: unit
        )
    }
    
    var body : some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack {
                ActivityFormView(
                    name: $name, description: $description,
                    unit: $unit, amountDone: $amountDone,
                    chosenColor: $chosenColor, lightText: $lightText,
                    baseIncrement: $baseIncrement
                )
                VStack {
                    Text("Preview")
                        .font(.system(size: 20).bold())
                    HStack(alignment: .center) {
                        ActivityGridView(
                            activity: mockActivity,
                            isPreview: true
                        )
                    }
                }
            }
        }.toolbar {
            Button("Save") {
                let activityColor = ActivityColor(
                    color: chosenColor,
                    lightText: lightText
                )
                let activity = Activity(
                    name: name,
                    activityColor: activityColor,
                    description: description,
                    amountDone: amountDone,
                    baseIncrement: baseIncrement,
                    unit: unit
                )
                addOrEditActivity(activity)
                dismiss()
            }
        }
    }
}

#Preview {
    let addOrEditActivity : (_ activity : Activity) -> Void = { activity in
        print("saved")
    }
    NavigationStack {
        AddActivityView(
            addOrEditActivity: addOrEditActivity
        )
    }
}

