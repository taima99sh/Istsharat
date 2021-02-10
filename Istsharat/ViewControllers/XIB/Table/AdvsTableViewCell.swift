//
//  AdvsTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/10/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class AdvsTableViewCell: UITableViewCell {
    
    var img: String = ""

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell () {
        imgView.LoadImageFromUrl(url: img)
    }
    
}
