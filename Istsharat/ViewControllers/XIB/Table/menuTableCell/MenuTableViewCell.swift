//
//  MenuTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class MenuTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func configureCell() {
        if let obj = self.object?.object as? Constant.MenuItems {
            self.imgIcon.image = obj.img
            self.lblTitle.text = obj.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
