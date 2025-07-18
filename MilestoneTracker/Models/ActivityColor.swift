//
//  ActivityColor.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct ActivityColor : Codable, Hashable {
    var red : Double
    var blue : Double
    var green : Double
    //var alpha : Double
    var lightText : Bool
    
    var color : Color {
        Color(red: red, green: green, blue: blue)
    }
    
    init(color : Color, lightText : Bool) {
        self.lightText = lightText
        if let rgba = color.toRGBA() {
            red = Double(rgba.red)
            blue = Double(rgba.blue)
            green = Double(rgba.green)
            //alpha = Double(rgba.alpha)
        } else {
            red = 1.0
            blue = 1.0
            green = 1.0
            //alpha = 1.0
        }
    }
}
