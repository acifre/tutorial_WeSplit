//
//  ContentView.swift
//  WeSplit
//
//  Created by Anthony Cifre on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [0, 10, 15, 18, 20, 25]
    
    @State private var checkAmount = 20.0
    @State private var numberOfPeople = 0
    
    
    @State private var tapCount = 0
    @State private var chosenPercentage = 18
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return (checkAmount * ((Double(chosenPercentage) * 0.01) + 1)) / peopleCount
        
    }
    
    //let peopleCount = Double(numberOfPeople + 2)
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    Section("Check Amount") {
                        TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .padding()
                    }
                    
                    Section {
                        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .padding()
                    }
                    Section("Amount of People Splitting Check") {
                        Picker("Select number of people:", selection: $numberOfPeople) {
                            ForEach(2..<100) { number in
                                Text("\(number) people")
                            }
                        }
                        //.pickerStyle(.wheel)
                    }
                    Section("How much tip do you want to leave?") {
                        Picker("Select your tip percentage", selection: $chosenPercentage) {
                            ForEach(tipPercentages, id: \.self) { number in
                                Text(number, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Summary") {
                        Text("Check Amount: \(round(checkAmount))")
                        Text("Tip Percentage: \(chosenPercentage)%")
                        Text("Number of People: \(numberOfPeople + 2)")
                        Text("Total per person: \(totalPerPerson)")
                    }
                }

            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
