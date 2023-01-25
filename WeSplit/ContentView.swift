//
//  ContentView.swift
//  WeSplit
//
//  Created by Anthony Cifre on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var chosenPercentage = 18
    
    let tipPercentages = [0, 10, 15, 18, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = (Double(chosenPercentage) * 0.01) + 1
        return (checkAmount * tipSelection) / peopleCount
        
    }
    
    var totalAmount: Double {
        let tipSelection = (Double(chosenPercentage) * 0.01) + 1
        return checkAmount + tipSelection
    }
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    Section("Check Amount") {
                        TextField("Check Amount", value: $checkAmount, format: currencyFormat)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    
                    Section("Number of People Splitting Check") {
                        Picker("Select number of people:", selection: $numberOfPeople) {
                            ForEach(2..<100) { number in
                                Text("\(number) people")
                            }
                        }
                        //.pickerStyle(.wheel)
                    }
                    Section("How much tip do you want to leave?") {
                        Picker("Select your tip percentage:", selection: $chosenPercentage) {
                            ForEach(0..<101) { number in
                                Text(number, format: .percent)
                            }
                        }
                    }
                    
                    Section("Summary") {
                        HStack {
                            Text("Check Amount:")
                            Text(checkAmount, format: currencyFormat)
                        }
                        Text("Tip Percentage: \(chosenPercentage)%")
                        Text("Number of People: \(numberOfPeople + 2)")

                    }
                    
                    Section("Final Amount") {
                        HStack {
                            Text("Total Check Amount:")
                            Text((checkAmount > 0 ? totalAmount : 0.0), format: currencyFormat)
                                .foregroundColor(chosenPercentage == 0 ? .red : .primary)
                        }
                        HStack {
                            
                            Text("Total Per Person:")
                            Text(totalPerPerson, format: currencyFormat)
                        }
                        .fontWeight(.bold)
                    }
                }

            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
