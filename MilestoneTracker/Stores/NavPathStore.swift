//
//  NavPathStore.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

@Observable
class NavPathStore {
    var navPath : NavigationPath {
        didSet {
            savePath()
        }
    }
    
    private let navPathSaveLocation = URL.documentsDirectory.appending(path: "navigationPathSave")
    
    func savePath() {
        guard let navPathRepresentation = navPath.codable else {
            return
        }
        do {
            let data = try JSONEncoder().encode(navPathRepresentation)
            try data.write(to: navPathSaveLocation)
        } catch {
            print("Failed to save navigation data: \(error.localizedDescription)")
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: navPathSaveLocation) {
            if let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data
            ) {
                navPath = NavigationPath(decoded)
                return
            }
        }
        navPath = NavigationPath()
    }
}
