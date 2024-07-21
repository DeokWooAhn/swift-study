//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 안덕우 on 7/6/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var companyIconImageView: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var companyPriceLabel: UILabel!
    
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
//        let color: UIColor
//        if stock.diff > 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
        
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}
