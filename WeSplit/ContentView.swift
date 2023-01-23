//
//  ContentView.swift
//  WeSplit
//
//  Created by Anthony Cifre on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [0, 10, 15, 18, 20, 25]
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var chosenPercentage = 18
    
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
                    
                    Section("Tip Percentage") {
                        Picker("Select your tip percentage", selection: $chosenPercentage) {
                            ForEach(tipPercentages, id: \.self) { number in
                                Text(String(number))
                            }
                        }
                        .padding()
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
