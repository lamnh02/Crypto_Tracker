//
//  ContentView.swift
//  Crypto_Tracker
//
//  Created by Huu Lam Nguyen on 28/03/2022.
//

import SwiftUI
import Foundation




struct ContentView: View {
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
