//
//  ActivityListView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

struct ActivityListView : View {
    let activity : Activity
    
    var body : some View {
        NavigationLink(value: activity.id){
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
                        baseIncrement: 15,
                        unit: "times",
                        lightText: activity.activityColor.lightText
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
    ActivityListView(activity: ActivityGridView.mockActivity)
}

