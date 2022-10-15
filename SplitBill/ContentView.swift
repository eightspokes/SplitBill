//
//  ContentView.swift
//  SplitBill
//
//  Created by Roman on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,30,0]
    
    var body: some View {
        
        
            NavigationView{
                Form{
                    Section{
                        TextField("Check amount: ", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                    
                            
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                    }
                header:{
                    Text("Enter the Check amount")
                }
                    Section("How much tip do you want to leave"){
                        Picker("Tip percentage", selection: $tipPercentage){
                            ForEach(tipPercentages, id: \.self){
                                Text($0 , format: .percent )
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section("Check amount"){
                        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                }
                .navigationTitle("SplitBill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
