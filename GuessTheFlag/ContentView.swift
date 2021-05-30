//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Smital on 30/05/21.
//  Copyright © 2021 IoSmit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var chosenCountry = Int.random(in:0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""

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
                       print("Button tapped \(element)")
                       self.flagTapped(element)
                   }) {
                       Image(self.countries[element]).renderingMode(.original)
                   }
               }
               Spacer()
           }
       }.alert(isPresented: $showingScore) {
           Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
               self.askQuestion()
           })
       }


    }

    func flagTapped(_ number: Int) {
        if number == chosenCountry {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        chosenCountry = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
