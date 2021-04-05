// MARK:  ContentView.swift



 // ////////////////
//  MARK: LIBRARIES

import SwiftUI





 // //////////////////////////////////
// MARK: struct ContentView: View { }

struct ContentView: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var tipAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var numberOfPeopleString: String = ""
    @State private var tipPercentage: Int = 2
    
    
    
    // ////////////////
   // MARK: PROPERTIES
    
    let tipPercentages: [Int] = [ 0 , 10 , 15 , 20 , 25 ]
    
    
    
    // /////////////////////////
   // MARK: COMPUTED PROPERTIES
    
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
    
    
    var totalAmount: Double {
        
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount: Double = Double(tipAmount) ?? 0.00
        
        let tipValue: Double = orderAmount / 100 * tipSelection
        let grandTotal: Double = orderAmount + tipValue
        
        return grandTotal
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
                
                
                Section(header : Text("Number of people :")) {
                    TextField("How many people are you ?" ,
                              text : $numberOfPeopleString)
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header : Text("Select your tip percentage :")) {
                    Picker("Select your tip percentage ." ,
                           selection : $tipPercentage) {
                        ForEach(0..<tipPercentages.count) { (tipIndex: Int) in
                            return Text("\(self.tipPercentages[tipIndex])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Grand total :")) {
                    Text("\(totalAmount , specifier : "%.2f") $")
                }
                
                
                Section(header : Text("Your tip :")) {
                    Text("\(totalAmountPerPerson , specifier : "%.2f") $")
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
            }
            .navigationBarTitle("We Split")
        }
    }
}





 // //////////////
// MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue : "iPhone 12 Pro"))
    }
}
