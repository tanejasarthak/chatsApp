//
//  ChatScreenTableViewCell.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import UIKit

class ChatScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCells(model: ChatScreenViewModel?) {
        guard let model = model else  { return }
        messageLabel.text = model.message
        dateTimeLabel.text = model.dateTime
    }
}
