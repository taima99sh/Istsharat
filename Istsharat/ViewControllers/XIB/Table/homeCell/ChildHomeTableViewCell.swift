//
//  ChildHomeTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ChildHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var lblText: UILabel!
    
    var object: Topic?
    

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
            //self.lblNum.text = obj.pTitle ?? "بدون عنوان"
            self.lblText.text = obj.pSummary.count == 0 ? "\(obj.pTitle ?? "")" : "\(obj.pSummary ?? "")"
        }
    }
    
}
