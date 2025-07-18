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
    @StateObject private var activityVM = ActivityViewModel()
    @State private var navigationPathStore = NavPathStore()
    let columns = [
        GridItem(.adaptive(minimum:150))
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPathStore.navPath) {
            ScrollView {
                if(showAsGrid) {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(activityVM.activities), id:\.key) { (id: UUID, activity : Activity) in
                            //Since it's `Identifiable` it doesn't need us to specify `id:`
                            ActivityGridView(
                                activity: activity,
                                isPreview: false
                            )
                        }
                    }
                    .padding(.horizontal, 10)
                } else {
                    LazyVStack {
                        ForEach(Array(activityVM.activities), id:\.key) { (id: UUID, activity : Activity) in
                            ActivityListView(
                                activity: activity,
                                isPreview: false
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
            .navigationDestination(for: Activity.self) { activity in
                AddActivityView(
                    activity: activity,
                    addOrEditActivity: activityVM.addOrEditActivity
                )
            }
            .navigationDestination(for: String.self) { route in
                if route == "addActivity" {
                    AddActivityView(
                        addOrEditActivity: activityVM.addOrEditActivity
                    )
                }
            }
        }
        .environmentObject(activityVM)
    }
}

#Preview {
   ContentView()
}
