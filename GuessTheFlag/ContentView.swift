//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Smital on 30/05/21.
//  Copyright © 2021 IoSmit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var chosenCountry = Int.random(in:0...2)
    var body: some View {
       ZStack {
           Color.blue.edgesIgnoringSafeArea(.all)
           VStack(spacing: 30) {
               VStack {
                   Text("Tap the flag of").foregroundColor(.white)
                   Text(countries[chosenCountry]).foregroundColor(.white)
               }

               ForEach(0..<3) { element in
                   Button(action: {
                       print("Button tapped")
                   }) {
                       Image(self.countries[element]).renderingMode(.original)
                   }
               }
               Spacer()
           }
       }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
