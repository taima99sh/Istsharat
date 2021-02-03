//
//  ChatListTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblNumOfMessages: UILabel!
    
    var haveNewMessage: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        lblNumOfMessages.isHidden = self.haveNewMessage ? false : true
        viewColor.backgroundColor = self.haveNewMessage ? "lineColor".myColor : .white
    }
}
