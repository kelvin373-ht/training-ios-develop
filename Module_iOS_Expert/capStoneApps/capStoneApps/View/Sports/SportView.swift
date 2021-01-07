//
//  SportView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct SportView: View {
    @ObservedObject var presenterSport: SportsPresenter
    
    var body: some View {
        ZStack {
                if presenterSport.loadingState {
                    VStack {
                        Text("Loading...")
                        ActivityIndicator()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenterSport.sports, id: \.id) { sport in
                            VStack {
                                Text(sport.name)
                            }
                        }
                    }
                }
            }.onAppear {
                if self.presenterSport.sports.count == 0 {
                    self.presenterSport.getSports()
                }
            }
            .navigationBarTitle(Text("Sport"), displayMode: .automatic)
    }
}
