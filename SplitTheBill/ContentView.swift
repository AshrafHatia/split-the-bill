//
//  ContentView.swift
//  SplitTheBill
//
//  Created by Ashraf Hatia on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalcost = ""
    @State private var person = 4
    @State private var tipIdex = 2
    let tipPercentage = [0,5,10,15]
    
    func calculateTotal() -> (payable: Double, tipAmount: Double,orderTotal: Double) {
        let tip = Double(tipPercentage[tipIdex])
        let orderTotal = Double(totalcost) ?? 0
        let finalAmount = ((orderTotal / 100 * tip) + orderTotal)

        let tipAmount = (orderTotal / 100 * tip)
        // return finalAmount / Double(person)
        return (payable: finalAmount / Double(person), tipAmount: tipAmount ,orderTotal: orderTotal)
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Enter the amount")){
                    TextField("Amount",text: $totalcost).keyboardType(.decimalPad)
                }
                Section(header: Text("Select the tip amount (%)")){
                    Picker("Tip Percentage", selection: $tipIdex){
                        ForEach(tipPercentage.indices, id: \.self) { index in
                            Text("\(tipPercentage[index])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("How many people?")){
                    Picker("Number of people", selection: $person){
                        ForEach(0 ..< 25){
                            Text("\($0)")
                        }
                    }
                }
                
                Section(header: Text("Total per person")){
                    Text("$ \(calculateTotal().payable,specifier: "%.2f")")
                }
                
                if(calculateTotal().orderTotal > 0){
                    Section(header: Text("Total brak down")){
                        HStack{
                            Text("Sub Total")
                            Spacer()
                            Text("$ \(calculateTotal().orderTotal,specifier: "%.2f")")
                        }
                        HStack{
                            Text("Tip")
                            Spacer()
                            Text("$ \(calculateTotal().tipAmount,specifier: "%.2f")")
                        }
                        HStack{
                            Text("Total")
                            Spacer()
                            Text("$ \(calculateTotal().orderTotal + calculateTotal().tipAmount,specifier: "%.2f")")
                        }
                        
                    }
                }
            }.navigationTitle("Split the Bill")
            
        }
    }
}

#Preview {
    ContentView()
}
