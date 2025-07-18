//
//  ActivityListView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

struct ActivityListView : View {
    let activity : Activity
    let isPreview : Bool
    
    var body : some View {
        NavigationLink(value: activity){
            HStack {
                VStack() {
                    Text(activity.name)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(activity.activityColor.lightText ? Color.white : Color.black)
                        .font(.system(size: 20).bold())
                }
                .frame(maxHeight: .infinity)
                VStack {
                    Spacer()
                        .padding(.bottom)
                    Spacer()
                        .padding(.bottom)
                    CentralCountView(
                        amountDone: activity.amountDone,
                        unit: activity.unit,
                        lightText: activity.activityColor.lightText
                    )
                    QuickCountArea(
                        id: activity.id,
                        baseIncrement: 15,
                        unit: "times",
                        lightText: activity.activityColor.lightText,
                        isPreview: isPreview
                    )
                    Spacer()
                        .padding(.top)
                }
            }
            .frame(height: 200)
            .background(activity.activityColor.color)
            .cornerRadius(10)
            
        }
    }
}

#Preview {
    ActivityListView(activity: ActivityGridView.mockActivity, isPreview: true)
}

