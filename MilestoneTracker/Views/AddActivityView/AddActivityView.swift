//
//  AddActivityView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct AddActivityView : View {
    var id : UUID?
    @State private var name : String = ""
    let unitOptions = ["mins", "hrs", "times", "days"]
    
    @State private var chosenColor : Color = Color.purple
    @State private var description : String = ""
    @State private var amountDone : Int = 0
    @State private var baseIncrement : Int = 1
    @State private var unit : String = "times"
    @State private var lightText : Bool = false
    
    var mockActivity : Activity {
        let activityColor = ActivityColor(
            color: chosenColor,
            lightText: lightText
        )
        return Activity(
            name: name.isEmpty ? "Example" : name,
            activityColor: activityColor,
            description: description,
            amountDone: 30,
            baseIncrement : 2,
            unit: "mins"
        )
    }
    
    var body : some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack {
                Form {
                    Section("Information") {
                        TextField("Name", text: $name)
                        VStack(alignment: .leading) {
                            Text("Description")
                                .padding(.top, 8)
                            ZStack(alignment: .topLeading) {
                                
                                TextEditor(text: $description)
                                //Placeholder text to indicate
                                if(description.isEmpty) {
                                    Text("What is this about?")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 5)
                                        .padding(.top, 8)
                                }
                            }
                        }
                        HStack {
                            Text("Amount to start at")
                            TextField("Amount done so far", value: $amountDone, format: .number)
                        }
                        Picker("Unit", selection: $unit) {
                            ForEach(unitOptions, id:\.self) { unitOption in
                                Text(unitOption)
                            }
                        }
                    }
                    Section("Display") {
                        ColorPicker("Choose a color", selection: $chosenColor)
                            .padding()
                        Toggle("LightText", isOn: $lightText)
                            .padding()
                    }
                }
                VStack {
                    Text("Preview")
                        .font(.system(size: 20).bold())
                    HStack(alignment: .center) {
                        ActivityGridView(
                            activity: mockActivity
                        )
                    }
                }
            }
        }.toolbar {
            Button("Save") {
                // Save code here
            }
        }
    }
}

#Preview {
    let nilid : UUID? = nil
    NavigationStack {
        AddActivityView(id: nilid)
    }
}

