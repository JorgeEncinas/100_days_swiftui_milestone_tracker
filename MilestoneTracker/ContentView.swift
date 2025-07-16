//
//  ContentView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showAsGrid = true
    @State private var activities = [Activity]()
    
    let columns = [
        GridItem(.adaptive(minimum:50))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if(showAsGrid) {
                    LazyVGrid(columns: columns) {
                        ForEach(activities) { (activity : Activity) in
                            //Since it's `Identifiable` it doesn't need us to specify `id:`
                            ActivityGridView(
                                activity: activity
                            )
                        }
                    }
                } else {
                    LazyVStack {
                        //ForEach(activities) { (activity : Activity) in
                            
                        //}
                    }
                }
                Text("Hello")
            }
            .navigationTitle("Milestone Tracker")
            .toolbar {
                ToolbarItem {
                    Button {
                        //Take me to the view for adding an activity
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: UUID.self) { id in
                // Open the view here!
            }
        }
    }
}

#Preview {
   ContentView()
}
