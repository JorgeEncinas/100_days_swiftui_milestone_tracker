//
//  ColorRGBAExtension.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

// Done with ChatGPT
extension Color {
    func toRGBA() -> (red : CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        let uiColor = UIColor(self)
        
        var red : CGFloat = 0
        var blue : CGFloat = 0
        var green : CGFloat = 0
        var alpha : CGFloat = 0
        
        if uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red, green, blue, alpha)
        }
        return nil
    }
}
