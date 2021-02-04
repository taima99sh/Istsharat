//
//  ConsultationsListTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ConsultationsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell() {}

}
