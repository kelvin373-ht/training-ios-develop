//
//  ProfileView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var profilePresenter: ProfilePresenter
    @EnvironmentObject var presenterGameFavorite: GameFavoritePresenter
    @EnvironmentObject var presenterMovieFavorite: MovieFavoritePresenter
    @EnvironmentObject var presenterTravelFavorite: TravelFavoritePresenter
    @EnvironmentObject var presenterSportFavorite: SportFavoritePresenter

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("background_profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("photos_profile")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .offset(y: -50)
                        .padding(.bottom, -50)

                    Text(self.profilePresenter.profile.name)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text(self.profilePresenter.profile.job)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text(self.profilePresenter.profile.company)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }.edgesIgnoringSafeArea(.top)

                VStack {
                    Text("Your Favorite")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top)

                    NavigationLink(destination: MovieFavoriteView(presenterMovieFavorite: presenterMovieFavorite)) {
                        TabFavoriteViewUI(title: "MOVIE", image: ConstantVal.TabBarImage.movieTabBar)
                    }
                    NavigationLink(destination: GameFavoriteView(presenterGameFavorite: presenterGameFavorite)) {
                        TabFavoriteViewUI(title: "GAME", image: ConstantVal.TabBarImage.gameTabBar)
                    }
                    NavigationLink(destination: SportFavoriteView(presenterSportFavorite: presenterSportFavorite)) {
                        TabFavoriteViewUI(title: "SPORT", image: ConstantVal.TabBarImage.sportTabBar)
                    }
                    NavigationLink(destination: TravelFavoriteView(presenterTravelFavorite: presenterTravelFavorite)) {
                        TabFavoriteViewUI(title: "TRAVEL", image: ConstantVal.TabBarImage.travelTabBar)
                    }
                }.padding(.bottom)
                .edgesIgnoringSafeArea(.top)

            }.onAppear {
                self.profilePresenter.getProfile()
            }
        }
    }
}
