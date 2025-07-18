//
//  AddActivityView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct AddActivityView : View {
    var id : UUID?
    @Environment(\.dismiss) var dismiss
    @Binding var activities : [Activity]
    @State private var name : String = ""
    @State private var chosenColor : Color = Color.purple
    @State private var description : String = ""
    @State private var amountDone : Int = 0
    @State private var baseIncrement : Int = 1
    @State private var unit : String = "times"
    @State private var lightText : Bool = false
    
    var mockActivity : Activity {
        let activityColor = ActivityColor(
            color: chosenColor,
            lightText: lightText
        )
        return Activity(
            name: name.isEmpty ? "Example" : name,
            activityColor: activityColor,
            description: description,
            amountDone: 30,
            baseIncrement : 2,
            unit: "mins"
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
                    chosenColor: $chosenColor, lightText: $lightText
                )
                VStack {
                    Text("Preview")
                        .font(.system(size: 20).bold())
                    HStack(alignment: .center) {
                        ActivityGridView(
                            activity: mockActivity
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
                var activity = Activity(
                    name: name,
                    activityColor: activityColor,
                    description: description,
                    amountDone: amountDone,
                    baseIncrement: baseIncrement,
                    unit: unit
                )
                if let unwrappedId = id { //Existing activity?
                    activity.id = unwrappedId
                    activities = activities.map { $0.id == unwrappedId ?
                        activity : $0
                    }
                } else {
                    activities.append(activity)
                }
                dismiss()
            }
        }
    }
}

#Preview {
    @Previewable @State var activities = [Activity]()
    let nilid : UUID? = nil
    
    NavigationStack {
        AddActivityView(id: nilid, activities: $activities)
    }
}

