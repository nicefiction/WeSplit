//  ContentView.swift
import SwiftUI



struct ContentView: View {
    
    let humans: [String] = [
        
        "Dorothy" , "Glinda" , "Ozma" , "Dahlia"
    ]
    
    
    @State private var selectedHumanIndex: Int = 0
    
    
    var body: some View {
        
        
        
        
        VStack {
            Text(" Select a human :")
            Picker(" Select a human :" , selection : $selectedHumanIndex) {
                
                ForEach(0..<humans.count) { (index: Int) in
                    
                    Text("\(humans[index])")
                }
                
            }
            
            Text(" You have chosen \(humans[selectedHumanIndex]) .")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue : "iPhone 12 Pro"))
    }
}
