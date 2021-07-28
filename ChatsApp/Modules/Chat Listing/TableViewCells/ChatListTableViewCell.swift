//
//  ChatListTableViewCell.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var receipentNameLbl: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: ChatListingViewModel?) {
        guard let model = model else { return }
        receipentNameLbl.text = model.institutionName
        addressLabel.text = model.talukName + " , " + model.cityName + " , " + model.stateName
    }
}
