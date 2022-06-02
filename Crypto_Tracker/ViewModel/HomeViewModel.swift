//
//  HomeViewModel.swift
//  Crypto_Tracker
//
//  Created by Huu Lam Nguyen on 30/03/2022.
//

import SwiftUI
import Foundation
// https://api.nomics.com/v1/currencies/ticker?key=702a4b676e4744468d9f389260f0e2259ca5b09c&interval=1d&sort=rank&convert=USD&per-page=50&page=1
// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Cryptocurrency] = []
    
    
    func fetch() {
        guard let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=702a4b676e4744468d9f389260f0e2259ca5b09c&interval=1d&sort=rank&convert=USD&per-page=50&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
//            convert to json
            do {
                let coins = try JSONDecoder().decode([Cryptocurrency].self, from: data)
                DispatchQueue.main.async {
                    self?.coins = coins
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
