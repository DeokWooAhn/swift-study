//
//  OnboardingViewCell.swift
//  NRCOnboarding
//
//  Created by 안덕우 on 8/9/24.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descirptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descirptionLabel.text = message.description
    }
}
