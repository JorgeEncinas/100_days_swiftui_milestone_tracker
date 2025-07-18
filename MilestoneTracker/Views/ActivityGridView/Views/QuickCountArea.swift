//
//  CounterAreaView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct QuickCountArea : View {
    let baseIncrement : Int
    let unit : String
    let lightText : Bool
    
    var body : some View {
        HStack(alignment: .center) {
            CounterButtonView(
                buttonAppleName: "minus.circle",
                lightText: lightText
            )
            VStack {
                Text("\(baseIncrement)")
                    .foregroundStyle(lightText ? .white : .black)
                    .font(.system(size: 20).bold())
                Text(unit)
                    .foregroundStyle(lightText ? .white : .black)
                    .font(.system(size:16).bold())
            }
            
            CounterButtonView(
                buttonAppleName: "plus.circle",
                lightText: lightText
            )
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        //.overlay(Rectangle())
    }
}

#Preview {
    QuickCountArea(baseIncrement: 15, unit: "mins", lightText: false)
        .preferredColorScheme(.light)
}
