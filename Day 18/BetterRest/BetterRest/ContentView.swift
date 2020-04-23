//
//  ContentView.swift
//  BetterRest
//
//  Created by Victor Cordero Utrilla on 4/20/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
        
    var body: some View {
        NavigationView{
            Form {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
                Section(header: Text("Desired amount to sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker(selection: $coffeeAmount, label: Text("Cups")) {
                        ForEach(0 ..< 20) {
                            Text("\($0+1) \($0 == 0 ? "cup" : "cups")")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Your ideal bedtime is:").font(.title)) {
                    Text("\(calculateBedTime())")
                }
            }
            .navigationBarTitle("BetterRest", displayMode: .inline)
        }
    }
    
    func calculateBedTime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        } catch {
            NSLog(error.localizedDescription)
            return error.localizedDescription
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
