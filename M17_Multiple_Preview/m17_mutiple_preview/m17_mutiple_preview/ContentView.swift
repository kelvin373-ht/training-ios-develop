//
//  ContentView.swift
//  m17_mutiple_preview
//
//  Created by Kelvin HT on 7/4/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 7"))
            .previewDisplayName("iPhone 7 AlgoKelvin Old Version")
    }
}
