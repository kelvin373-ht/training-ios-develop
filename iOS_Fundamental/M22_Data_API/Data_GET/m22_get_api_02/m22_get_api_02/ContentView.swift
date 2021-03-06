//
//  ContentView.swift
//  m22_get_api_02
//
//  Created by Kelvin HT on 7/25/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var games: [Game] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter username...", text: $text, onEditingChanged: { _ -> Void in
                    
                    
                    
                }) {
                    print("Username onCommit")
                }
                
                Button(action: {
                    
                    self.text = ""
                    
                }) {
                    
                    Text("Cancel")
                        .padding()
                        .foregroundColor(Color.black)
                    .background(Color(red: 200.0/255, green: 200.0/255, blue: 200.0/255, opacity: 1.0))
                
                }
            }
            
            Text("Input : \(text)")
            
            ForEach(games, id: \.id) { x in
                Text(x.name)
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
