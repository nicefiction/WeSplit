//  ContentView.swift
import SwiftUI



struct ContentView: View {
    
    @State private var tipAmount: String = ""
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Int = 2
    
    let tipPercentages: [Int] = [ 5 , 10 , 15 , 20 , 25 ]
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Enter your tip amount ." ,
                              text : $tipAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Amount of people :" ,
                           selection : $numberOfPeople) {
                        
                        ForEach(2..<100) { (amountOfPeople: Int) in
                            
                            return Text("\(amountOfPeople)")
                        }
                    }
                }
                
                
                Section(header: Text("Select your tip percentage :")) {
                    Picker("Select your tip percentage ." ,
                           selection : $tipPercentage) {
                        
                        ForEach(0..<tipPercentages.count) { (tipIndex: Int) in
                            
                            return Text("\(tipPercentages[tipIndex])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section {
                    Text("Your tip amount : \(tipAmount) $")
                }
            }
            .navigationTitle("We Split")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue : "iPhone 12 Pro"))
    }
}
