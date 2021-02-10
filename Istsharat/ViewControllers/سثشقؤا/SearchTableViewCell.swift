//
//  SearchTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    
     var object: Page?

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
            self.lblTitle.text = obj.pTitle ?? "بدون عنوان"
            self.lblText.text = "\(obj.pSummary ?? "")..."
        }
    }

}
