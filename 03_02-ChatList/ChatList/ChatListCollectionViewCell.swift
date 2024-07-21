//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 안덕우 on 7/20/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = chat.date
    }
}
