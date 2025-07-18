//
//  DataManager.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

class DataManager {
    //ChatGPT
    static func getDataDirectory() -> URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dataDir = documents.appendingPathComponent("Data")

        if !FileManager.default.fileExists(atPath: dataDir.path) {
            try? FileManager.default.createDirectory(at: dataDir, withIntermediateDirectories: true)
        }

        return dataDir
    }
    
    //ChatGPT
    static func save<T : Codable>(file: String, contents: T) -> Void {
        do {
            let folder = getDataDirectory()
            let url = folder.appendingPathComponent(file)

            let data = try JSONEncoder().encode(contents)
            try data.write(to: url)
        } catch {
            print("Failed to save navigation data: \(error.localizedDescription)")
        }
    }
    
    //Again, ChatGPT for this one.
    static func load<T: Codable>(_ type: T.Type, from filename: String) -> T? {
        let folder = getDataDirectory()
        let url = folder.appendingPathComponent(filename)

        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Failed to load: \(error)")
            return nil
        }
    }
}
