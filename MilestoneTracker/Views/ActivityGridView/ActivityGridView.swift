//
//  ActivityGridView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct ActivityGridView : View {
    var activity : Activity
    let isPreview : Bool
    
    static var mockActivity : Activity {
        let activityColor : ActivityColor = ActivityColor(
            color: Color(red: 0.5, green: 0.3, blue: 0.6),
            lightText: true
        )
        return Activity(
            name: "100 Days of SwiftUI",
            activityColor: activityColor,
            description: "text",
            amountDone: 104,
            baseIncrement: 15,
            unit: "times"
        )
    }
    
    var body : some View {
        NavigationLink(value: activity) {
            VStack {
                VStack() {
                    Text(activity.name)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(activity.activityColor.lightText ? Color.white : Color.black)
                        .font(.system(size: 20).bold())
                }
                .frame(maxHeight: .infinity)
                //.background(.red)
                CentralCountView(
                    amountDone: activity.amountDone,
                    unit: activity.unit,
                    lightText: activity.activityColor.lightText
                )
                
                QuickCountArea(
                    id: activity.id,
                    baseIncrement: activity.baseIncrement,
                    unit: activity.unit,
                    lightText: activity.activityColor.lightText,
                    isPreview: isPreview
                )
            }
            .frame(height: 200)
            .containerRelativeFrame(.horizontal) { width, axes in
                width * 0.47
            }
            .background(activity.activityColor.color)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ActivityGridView(activity: ActivityGridView.mockActivity, isPreview: true)
}
