//
//  FormView.swift
//  MilestoneTracker
//
//  Created by Jorge Encinas on 7/17/25.
//
import SwiftUI

struct ActivityFormView : View {
    @Binding var name : String
    @Binding var description : String
    @Binding var unit : String
    @Binding var amountDone : Int
    @Binding var chosenColor : Color
    @Binding var lightText : Bool
    let unitOptions = ["mins", "hrs", "times", "days"]
    
                 
    var body : some View {
        Form {
            Section("Information") {
                HStack {
                    Text("Name:")
                        .labelColorDarkBlue()
                    TextField("Name", text: $name)
                        .autocapitalization(.sentences)
                }
                
                VStack(alignment: .leading) {
                    Text("Description:")
                        .padding(.top, 8)
                        .labelColorDarkBlue()
                    ZStack(alignment: .topLeading) {
                        
                        TextEditor(text: $description)
                            .frame(minHeight: 60, maxHeight: 150)
                        //Placeholder text to indicate
                        if(description.isEmpty) {
                            Text("What is this about?")
                                .foregroundColor(
                                    Color(red: 200/255, green: 200/255, blue: 200/255)
                                )
                                .padding(.leading, 5)
                                .padding(.top, 8)
                        }
                    }
                }
                HStack {
                    Text("Amount to start at:")
                        .labelColorDarkBlue()
                    TextField("Amount done so far", value: $amountDone, format: .number)
                        .keyboardType(.numberPad)
                        //.overlay(
                        //    RoundedRectangle(cornerRadius: 8)
                        //        .stroke(Color.blue, lineWidth: 2)
                        //)
                        .multilineTextAlignment(.trailing)
                }
                Picker(selection: $unit) {
                    ForEach(unitOptions, id:\.self) { unitOption in
                        Text(unitOption)
                    }
                } label: {
                    Text("Unit:")
                        .labelColorDarkBlue()
                }
            }
            Section("Display") {
                ColorPicker(selection: $chosenColor) {
                    Text("Choose a color:")
                        .labelColorDarkBlue()
                }
                .padding(.vertical, 5)

                Toggle(isOn: $lightText) {
                    Text("Light Text")
                        .labelColorDarkBlue()
                }
                .padding(.vertical, 5)
            }
        }
    }
}

#Preview {
    @Previewable @State var name = ""//"Example"
    @Previewable @State var description = "" //Some new activity that we want to perform daily to form a habit
    @Previewable @State var unit = "mins"
    @Previewable @State var amountDone = 0
    @Previewable @State var chosenColor = Color.purple
    @Previewable @State var lightText = true
    ActivityFormView(
        name: $name,
        description: $description,
        unit: $unit,
        amountDone: $amountDone,
        chosenColor: $chosenColor,
        lightText: $lightText
    )
}
