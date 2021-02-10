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
        
    var unreadNum: Int = 0 {
        didSet {
            if self.unreadNum == 0 {
                viewColor.backgroundColor = .white
                lblNumOfMessages.isHidden = true
            } else {
                viewColor.backgroundColor = "lineColor".myColor
                lblNumOfMessages.text = "\(unreadNum)"
                lblNumOfMessages.isHidden = false
            }
        }
    }
    
    var object: ChatSession?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureCell() {
        if let obj = self.object {
            self.lblName.text = obj.category ?? "استشارة صحية"
            self.lblTime.text = obj.createdAt ?? Date().toString(customFormat: "HH:mm")
            unreadNum = obj.unread ?? 0
        }
    }
}
