//
//  MarketView.swift
//  Crypto_Tracker
//
//  Created by Huu Lam Nguyen on 28/03/2022.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .background(Color.gray)
            
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
            
        }
    }
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
    }
}

struct MarketView: View {
    
    @StateObject var homeData = HomeViewModel()
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homeData.coins, id:\.self) { coin in
                    LazyHStack {
                        URLImage(urlString: coin.logo_url)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coin.currency)
                                .font(.headline)
                            Text(coin.price)
                                .font(.caption)
                        }
                    }
                    .padding(3)
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("CoinTracker")
            .onAppear {
                homeData.fetch()
            }
            .toolbar(content: {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    homeData.fetch()
                                }, label: {
                                    Label("reload", systemImage: "goforward")
                                })
                            }
                        })

        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
