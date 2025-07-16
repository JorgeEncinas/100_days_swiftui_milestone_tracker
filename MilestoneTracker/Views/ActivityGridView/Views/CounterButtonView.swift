//
//  CounterButtonView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct CounterButtonView : View {
    let buttonAppleName : String
    let lightText : Bool
    
    var body : some View {
        Button {
            
        } label: {
            Image(systemName: buttonAppleName)
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
    CounterButtonView(buttonAppleName: "minus.circle", lightText: true)
        .preferredColorScheme(.dark)
}
