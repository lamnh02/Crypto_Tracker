////
////  Cryptocurrency.swift
////  Crypto_Tracker
////
////  Created by Huu Lam Nguyen on 30/03/2022.
////
//
import Foundation

struct Cryptocurrency: Hashable, Codable {
    let currency: String
    let price: String
    
    let logo_url: String

}
