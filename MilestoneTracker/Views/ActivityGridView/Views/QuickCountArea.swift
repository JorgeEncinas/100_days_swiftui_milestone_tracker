//
//  CounterAreaView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct QuickCountArea : View {
    let id : UUID
    let baseIncrement : Int
    let unit : String
    let lightText : Bool
    let isPreview : Bool
    
    var body : some View {
        HStack(alignment: .center) {
            CounterButtonView(
                id: id,
                lightText: lightText,
                increment: false,
                preview: isPreview
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
                id: id,
                lightText: lightText,
                increment: true,
                preview: isPreview
            )
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        //.overlay(Rectangle())
    }
}

#Preview {
    QuickCountArea(
        id: UUID(),
        baseIncrement: 15,
        unit: "mins",
        lightText: false,
        isPreview: true
    )
        .preferredColorScheme(.light)
}
