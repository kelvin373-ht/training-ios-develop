//
//  SportsEntity.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

struct DataSports: Decodable {
    let sports: [Sports]
}

struct Sports: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idSport = "idSport"
        case nameSport = "strSport"
        case backgroundImageSport = "strSportThumb"
        case descriptionSport = "strSportDescription"
    }

    let idSport: String?
    let nameSport: String?
    let backgroundImageSport: String?
    let descriptionSport: String?
}

struct SportModel: Equatable, Identifiable {
    let id: String
    let name: String
    let backgroundImage: String
    let description: String
}