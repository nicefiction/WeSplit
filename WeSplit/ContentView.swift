//  ContentView.swift
import SwiftUI



struct ContentView: View {
    
    @State private var tipAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 2
    
    let tipPercentages: [Int] = [ 5 , 10 , 15 , 20 , 25 ]
    
    
    var body: some View {
        
        Form {
            Section {
                TextField("Enter your tip amount ." ,
                          text : $tipAmount)
                    .keyboardType(.decimalPad)
                
                Text("Your tip amount : \(tipAmount) $")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue : "iPhone 12 Pro"))
    }
}
