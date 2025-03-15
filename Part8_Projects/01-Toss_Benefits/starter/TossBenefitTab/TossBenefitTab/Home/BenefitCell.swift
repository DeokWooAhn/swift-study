//
//  BenefitCell.swift
//  TossBenefitTab
//
//  Created by 안덕우 on 2/9/25.
//

import UIKit

class BenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var benefitImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: Benefit) {
        benefitImage.image = UIImage(named: item.imageName)
        descriptionLabel.text = item.description
        titleLabel.text = item.title
    }
}
