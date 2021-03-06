//
//  ResponseDetailGame.swift
//  GameCatalog
//
//  Created by Kelvin HT on 8/2/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

class ResponseDetailGame {
    /*Get Data Detail Game**/
    func getDataDetailGame(id: String, completion: @escaping (DetailGames) -> ()) {
        let url = URLRequest(url: URL(string: "https://api.rawg.io/api/games/\(id)")!)
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data2 = data, error == nil else {
                return
            }
                
            let jsonGame: DetailGames?
            do {
                jsonGame = try JSONDecoder().decode(DetailGames.self, from: data2)
                completion(jsonGame!) // To set value Detail Game in 'completion'
            }
            catch {
                print("Failed to convert \(error.localizedDescription)")
            }
                
        }.resume()
    }
}
