//
//  Home.swift
//  Crypto_Tracker
//
//  Created by Huu Lam Nguyen on 28/03/2022.
//

import SwiftUI

struct Home: View {
    
    
    var body: some View {
        
        TabView {
            MarketView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            MylistView()
                .tabItem {
                    Image(systemName: "bitcoinsign.circle")
                    Text("My List")
                }
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
