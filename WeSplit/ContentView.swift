//  ContentView.swift
import SwiftUI



struct ContentView: View {
    
    @State private var tipAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 2
    
    let tipPercentages: [Int] = [ 5 , 10 , 15 , 20 , 25 ]
    
    
    var totalAmountPerPerson: Double {
        
        let peopleCount: Double = Double(numberOfPeople + 2)
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount: Double = Double(tipAmount) ?? 0.00
        
        let tipValue: Double = orderAmount / 100 * tipSelection
        let grandTotal: Double = orderAmount + tipValue
        let amountPerPerson: Double = grandTotal / peopleCount
        
        print("People count : \(peopleCount) .\nTip selection : \(tipSelection) .\nOrder amount : \(orderAmount) .\nTip value : \(tipValue) .\nGrand total : \(grandTotal) .\nAmount per person : \(amountPerPerson) .")
        
        return amountPerPerson
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Enter your tip amount ." ,
                              text : $tipAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people :", selection: $numberOfPeople) {
                        
                        ForEach(2 ..< 100) {
                            
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section {
                    Text("\(numberOfPeople + 2) people selected .")
                    
                }
                
                Section(header : Text("Select your tip percentage :")) {
                    Picker("Select your tip percentage ." ,
                           selection : $tipPercentage) {
                        
                        ForEach(0..<tipPercentages.count) { (tipIndex: Int) in
                            
                            return Text("\(tipPercentages[tipIndex])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section {
                    Text("Your tip amount : \(totalAmountPerPerson , specifier : "%.2f") $")
                }
            }
            .navigationBarTitle("We Split")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue : "iPhone 12 Pro"))
    }
}
