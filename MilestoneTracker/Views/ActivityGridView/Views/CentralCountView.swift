//
//  CentralCountView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct CentralCountView : View {
    let amountDone : Int
    let unit : String
    let lightText : Bool
    
    var body : some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(amountDone)")
                .foregroundStyle(lightText ? .white : .black)
                .font(.system(size: 28).bold())
                .offset(x: 3)
            Text(unit)
                .foregroundStyle(lightText ? .white : .black)
                .font(.system(size: 16).bold())
                .offset(x: -3)
        }
    }
}

#Preview {
    CentralCountView(
        amountDone: 104,
        unit: "times",
        lightText: true
    )
    .preferredColorScheme(.dark)
}
