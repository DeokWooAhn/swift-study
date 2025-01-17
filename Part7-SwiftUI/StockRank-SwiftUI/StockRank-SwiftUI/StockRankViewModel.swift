//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by AhnDeokWoo on 1/8/25.
//

import Foundation

final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks = models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
}
