//
//  ContentView.swift
//  WeConvert
//
//  Created by Victor Cordero Utrilla on 04/13/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "20"
    @State private var unitSelection = 0
    @State private var inputSelection = 0
    @State private var outputSelection = 0
    
    let units = ["Temperature", "Lenght", "Time", "Volume"]
    
    var categories: [String: [String]] = [
        "Temperature": ["Celsius", "Fahrenheit", "Kelvin"],
        "Lenght": ["Meters", "Kilometers", "Feet", "Yards", "Miles"],
        "Time": ["Seconds", "Minutes", "Hours"],
        "Volume": ["Mililiters", "Liters", "Cups", "Pints", "Gallons"]
    ]
    
    // convert units
    var conversion: Measurement<Dimension> {
        let inputValue = Double(inputUnit) ?? 0
        let unitType = units[unitSelection]
        let inputCategory = categories[unitType]?[inputSelection]
        let outputCategory = categories[unitType]?[outputSelection]
        var unit: (Dimension, Dimension) = (UnitTemperature.celsius, UnitTemperature.celsius)
        switch (inputCategory, outputCategory) {
        case ("Celsius", "Celsius"):
            unit = (UnitTemperature.celsius, UnitTemperature.celsius)
        case ("Celsius", "Fahrenheit"):
            unit = (UnitTemperature.celsius, UnitTemperature.fahrenheit)
        case ("Celsius", "Kelvin"):
            unit = (UnitTemperature.celsius, UnitTemperature.kelvin)
        case ("Fahrenheit", "Celsius"):
            unit = (UnitTemperature.fahrenheit, UnitTemperature.celsius)
        case ("Fahrenheit", "Fahrenheit"):
            unit = (UnitTemperature.fahrenheit, UnitTemperature.fahrenheit)
        case ("Fahrenheit", "Kelvin"):
            unit = (UnitTemperature.fahrenheit, UnitTemperature.kelvin)
        case ("Kelvin", "Celsius"):
            unit = (UnitTemperature.kelvin, UnitTemperature.celsius)
        case ("Kelvin", "Fahrenheit"):
            unit = (UnitTemperature.kelvin, UnitTemperature.fahrenheit)
        case ("Kelvin", "Kelvin"):
            unit = (UnitTemperature.kelvin, UnitTemperature.kelvin)
        // Length
        case ("Meters", "Meters"):
            unit = (UnitLength.meters, UnitLength.meters)
        case ("Meters", "Kilometers"):
            unit = (UnitLength.meters, UnitLength.kilometers)
        case ("Meters", "Feet"):
            unit = (UnitLength.meters, UnitLength.feet)
        case ("Meters", "Yards"):
            unit = (UnitLength.meters, UnitLength.yards)
        case ("Meters", "Miles"):
            unit = (UnitLength.meters, UnitLength.miles)
        case ("Kilometers", "Meters"):
            unit = (UnitLength.kilometers, UnitLength.meters)
        case ("Kilometers", "Kilometers"):
            unit = (UnitLength.kilometers, UnitLength.kilometers)
        case ("Kilometers", "Feet"):
            unit = (UnitLength.kilometers, UnitLength.feet)
        case ("Kilometers", "Yards"):
            unit = (UnitLength.kilometers, UnitLength.yards)
        case ("Kilometers", "Miles"):
            unit = (UnitLength.kilometers, UnitLength.miles)
        case ("Feet", "Meters"):
            unit = (UnitLength.feet, UnitLength.meters)
        case ("Feet", "Kilometers"):
            unit = (UnitLength.feet, UnitLength.kilometers)
        case ("Feet", "Feet"):
            unit = (UnitLength.feet, UnitLength.feet)
        case ("Feet", "Yards"):
            unit = (UnitLength.feet, UnitLength.yards)
        case ("Feet", "Miles"):
            unit = (UnitLength.feet, UnitLength.miles)
        case ("Yards", "Meters"):
            unit = (UnitLength.yards, UnitLength.meters)
        case ("Yards", "Kilometers"):
            unit = (UnitLength.yards, UnitLength.kilometers)
        case ("Yards", "Feet"):
            unit = (UnitLength.yards, UnitLength.feet)
        case ("Yards", "Yards"):
            unit = (UnitLength.yards, UnitLength.yards)
        case ("Yards", "Miles"):
            unit = (UnitLength.yards, UnitLength.miles)
        case ("Miles", "Meters"):
            unit = (UnitLength.miles, UnitLength.meters)
        case ("Miles", "Kilometers"):
            unit = (UnitLength.miles, UnitLength.kilometers)
        case ("Miles", "Feet"):
            unit = (UnitLength.miles, UnitLength.feet)
        case ("Miles", "Yards"):
            unit = (UnitLength.miles, UnitLength.yards)
        case ("Miles", "Miles"):
            unit = (UnitLength.miles, UnitLength.miles)
        // Duration
        case ("Seconds", "Seconds"):
            unit = (UnitDuration.seconds, UnitDuration.seconds)
        case ("Seconds", "Minutes"):
            unit = (UnitDuration.seconds, UnitDuration.minutes)
        case ("Seconds", "Hours"):
            unit = (UnitDuration.seconds, UnitDuration.hours)
        case ("Minutes", "Seconds"):
            unit = (UnitDuration.minutes, UnitDuration.seconds)
        case ("Minutes", "Minutes"):
            unit = (UnitDuration.minutes, UnitDuration.minutes)
        case ("Minutes", "Hours"):
            unit = (UnitDuration.minutes, UnitDuration.hours)
        case ("Hours", "Seconds"):
            unit = (UnitDuration.hours, UnitDuration.seconds)
        case ("Hours", "Minutes"):
            unit = (UnitDuration.hours, UnitDuration.minutes)
        case ("Hours", "Hours"):
            unit = (UnitDuration.hours, UnitDuration.hours)
        // Volume
        case ("Mililiters", "Mililiters"):
            unit = (UnitVolume.milliliters, UnitVolume.milliliters)
        case ("Mililiters", "Liters"):
            unit = (UnitVolume.milliliters, UnitVolume.liters)
        case ("Mililiters", "Cups"):
            unit = (UnitVolume.milliliters, UnitVolume.cups)
        case ("Mililiters", "Pints"):
            unit = (UnitVolume.milliliters, UnitVolume.pints)
        case ("Mililiters", "Gallons"):
            unit = (UnitVolume.milliliters, UnitVolume.gallons)
        case ("Liters", "Mililiters"):
            unit = (UnitVolume.liters, UnitVolume.milliliters)
        case ("Liters", "Liters"):
            unit = (UnitVolume.liters, UnitVolume.liters)
        case ("Liters", "Cups"):
            unit = (UnitVolume.liters, UnitVolume.cups)
        case ("Liters", "Pints"):
            unit = (UnitVolume.liters, UnitVolume.pints)
        case ("Liters", "Gallons"):
            unit = (UnitVolume.liters, UnitVolume.gallons)
        case ("Cups", "Mililiters"):
            unit = (UnitVolume.cups, UnitVolume.milliliters)
        case ("Cups", "Liters"):
            unit = (UnitVolume.cups, UnitVolume.liters)
        case ("Cups", "Cups"):
            unit = (UnitVolume.cups, UnitVolume.cups)
        case ("Cups", "Pints"):
            unit = (UnitVolume.cups, UnitVolume.pints)
        case ("Cups", "Gallons"):
            unit = (UnitVolume.cups, UnitVolume.gallons)
        case ("Pints", "Mililiters"):
            unit = (UnitVolume.pints, UnitVolume.milliliters)
        case ("Pints", "Liters"):
            unit = (UnitVolume.pints, UnitVolume.liters)
        case ("Pints", "Cups"):
            unit = (UnitVolume.pints, UnitVolume.cups)
        case ("Pints", "Pints"):
            unit = (UnitVolume.pints, UnitVolume.pints)
        case ("Pints", "Gallons"):
            unit = (UnitVolume.pints, UnitVolume.gallons)
        case ("Gallons", "Mililiters"):
            unit = (UnitVolume.gallons, UnitVolume.milliliters)
        case ("Gallons", "Liters"):
            unit = (UnitVolume.gallons, UnitVolume.liters)
        case ("Gallons", "Cups"):
            unit = (UnitVolume.gallons, UnitVolume.cups)
        case ("Gallons", "Pints"):
            unit = (UnitVolume.gallons, UnitVolume.pints)
        case ("Gallons", "Gallons"):
            unit = (UnitVolume.gallons, UnitVolume.gallons)
        default:
            break
        }
        let fromUnit = Measurement(value: inputValue, unit: unit.0)
        let result = fromUnit.converted(to: unit.1)
        return result
    }
    
    var categoryCount: Int {
        return categories[units[unitSelection]]?.count ?? 0
    }
    
    var categoryValues: [String] {
        return categories[units[unitSelection]] ?? []
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $unitSelection, label:
                        Text("Unit Picker"), content: {
                            ForEach(0 ..< units.count) {
                                Text("\(self.units[$0])")
                            }
                    })
                }
                
                Section(header: Text("Enter a number to convert")) {
                    TextField("Enter number", text: $inputUnit)
                        //.keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input units")) {
                    Picker(selection: $inputSelection, label:
                        Text("Input"), content: {
                            ForEach(0 ..< categoryCount) {
                                Text("\(self.categoryValues[$0])")
                            }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output units")) {
                    Picker(selection: $outputSelection, label:
                        Text("Output"), content: {
                            ForEach(0 ..< categoryCount) {
                                Text("\(self.categoryValues[$0])")
                            }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:
                    Text("Output")
                        .font(.title)
                ) {
                    Text("\(conversion.value, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("Unit Converter"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
