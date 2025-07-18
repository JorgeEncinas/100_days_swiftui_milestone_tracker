//
//  ContentView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showAsGrid = true
    @State private var editMode = false
    @State private var activities : [Activity] {
        didSet {
            DataManager.save(file: "activities.json", contents: activities)
        }
    }
    @State private var navigationPathStore = NavPathStore()
    
    init() {
        if let activities = DataManager.load([Activity].self, from: "activities.json") {
            self.activities = activities
        } else {
            self.activities = [Activity]()
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum:150))
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPathStore.navPath) {
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
                    .padding(.horizontal, 10)
                } else {
                    LazyVStack {
                        ForEach(activities) { (activity : Activity) in
                            ActivityListView(
                                activity: activity
                            )
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
            .navigationTitle("Milestone Tracker")
            .toolbar {
                ToolbarItem {
                    Button {
                        navigationPathStore.navPath.append("addActivity")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                //ToolbarItem {
                //    Button(editMode ? "Finish" : "Edit") {
                //        editMode.toggle()
                //    }
                //}
                ToolbarItem {
                    Button {
                        showAsGrid.toggle()
                    } label: {
                        Image(systemName: showAsGrid ? "line.3.horizontal" : "square.grid.2x2")
                    }
                }
                //ToolbarItem {
                //    Button {
                //
                //    } label: {
                //        Image(systemName: "clock.arrow.circlepath")
                //    }
                //}
            }
            .navigationDestination(for: UUID.self) { id in
                AddActivityView(
                    id: id,
                    activities: $activities
                )
            }
            .navigationDestination(for: String.self) { route in
                if route == "addActivity" {
                    AddActivityView(
                        activities: $activities
                    )
                }
            }
        }
    }
}

#Preview {
   ContentView()
}
