//
//  CounterButtonView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct CounterButtonView : View {
    let id : UUID
    let lightText : Bool
    let increment : Bool
    let preview : Bool
    @EnvironmentObject var activityVM : ActivityViewModel
    
    var body : some View {
        Button {
            if !preview {
                activityVM.incrementCount(
                    id: id,
                    increment: increment
                )
            }
            
        } label: {
            Image(systemName: increment ? "plus.circle" : "minus.circle")
                .resizable()
                .scaledToFit()
                .opacity(0.8)
                .containerRelativeFrame(.horizontal) { width, axes in
                    width * 0.10
                }
                .padding(.horizontal, 10)
                .foregroundStyle(lightText ? .white : .black)
           
            
        }
    }
}

#Preview {
    CounterButtonView(
        id: UUID(),
        lightText: true,
        increment: false,
        preview: true
    )
        .preferredColorScheme(.dark)
}
