//
//  ContentView.swift
//  CaloryIntake
//
//  Created by Victor Cordero Utrilla on 4/3/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

enum DayParts: Int, CaseIterable, Hashable, Identifiable {
    case morning = 0
    case afternoon
    case evening
    
    var name: String {
        return "\(self)".capitalized
    }
    
    var id: DayParts { self }
}

enum Days: String, CaseIterable, Hashable, Identifiable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var id: Days { self }
}

struct ContentView: View {
    
    @State private var pickerSelected = 0
    
    @State private var dataPoint = DayParts.allCases.map { (part) in
        (dayPart: part, caloriesByDay: Days.allCases.map { (day) in
            (days: day.rawValue, calories: Int.random(in: 15...200))
        })
    }
    
    var body: some View {
        ZStack {
            Color("appBackground")
            
            VStack {
                Text("Calory Intake")
                    .font(.title)
                    .fontWeight(.bold)
                
                Picker(selection: $pickerSelected.animation(), label: Text("")) {
                    ForEach(DayParts.allCases) { (dayPart) in
                        Text(dayPart.name).tag(dayPart.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 16) {
                    ForEach(0..<self.dataPoint[pickerSelected].caloriesByDay.count, id: \.self) { index in
                        BarChartView(
                            label: self.$dataPoint[self.pickerSelected].caloriesByDay[index].days,
                            value: self.$dataPoint[self.pickerSelected].caloriesByDay[index].calories
                        )
                    }
                }
                .padding(.top, 20)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
