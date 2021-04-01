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
                    
                    Picker("How many will tip ?" ,
                           selection : $numberOfPeople) {
                        
                        ForEach(2..<100) { (amountOfPeople: Int) in
                            
                            Text("\(amountOfPeople) people")
                        }
                    }
                    
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
