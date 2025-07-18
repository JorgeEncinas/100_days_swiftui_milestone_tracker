//
//  LabelColorExtension.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

struct LabelColorDarkBlueModifier : ViewModifier {
    func body(content : Content) -> some View {
        content
            .foregroundStyle(Color(red: 0.0, green: 0.0, blue: 0.8))
            .fontWeight(.bold)
    }
}

extension View {
    func labelColorDarkBlue() -> some View {
        self.modifier(LabelColorDarkBlueModifier()) // I liked the addition of `self` here, I think it makes for a good explanation!
    }
}
