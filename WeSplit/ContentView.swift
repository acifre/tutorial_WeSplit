//
//  ContentView.swift
//  WeSplit
//
//  Created by Anthony Cifre on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var checkAmount = 20.0
    @State private var numberOfPeople = 0
    @State private var chosenPercentage = 18
    
    let tipPercentages = [0, 10, 15, 18, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = (Double(chosenPercentage) * 0.01) + 1
        return (checkAmount * tipSelection) / peopleCount
        
    }
    
    //let peopleCount = Double(numberOfPeople + 2)
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    Section("Check Amount") {
                        TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
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
                        HStack {
                            Text("Check Amount:")
                            Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        Text("Tip Percentage: \(chosenPercentage)%")
                        Text("Number of People: \(numberOfPeople + 2)")
                        HStack {
                            Text("Total per person:")
                            Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
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
