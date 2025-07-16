//
//  ActivityGridView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct ActivityGridView : View {
    let activity : Activity
    
    static var mockActivity : Activity {
        let activityColor : ActivityColor = ActivityColor(
            color: Color(red: 0.5, green: 0.3, blue: 0.6),
            lightText: false
        )
        return Activity(
            name: "100 Days of SwiftUI and macOS practicce",
            activityColor: activityColor,
            description: "text",
            amountDone: 104,
            baseIncrement: 15,
            unit: "times"
        )
    }
    
    var body : some View {
        NavigationLink(value: activity.id) {
            VStack {
                VStack() {
                    Text(activity.name)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(activity.activityColor.lightText ? Color.white : Color.black)
                        .font(.system(size: 20).bold())
                }
                .frame(maxHeight: .infinity)
                CentralCountView(
                    amountDone: activity.amountDone,
                    unit: activity.unit,
                    lightText: activity.activityColor.lightText
                )
                
                QuickCountArea(
                    baseIncrement: 15,
                    unit: "times",
                    lightText: activity.activityColor.lightText
                )
            }
            .frame(height: 200)
            .containerRelativeFrame(.horizontal) { width, axes in
                width * 0.5
            }
            .background(activity.activityColor.color)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ActivityGridView(activity: ActivityGridView.mockActivity)
}
