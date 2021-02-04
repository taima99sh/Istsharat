//
//  ConsultationsTableViewCell.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ConsultationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnDetails: UIButton!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnDetails(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationViewController")
        
        if let parent = self.parentViewController as? ConsultationsViewController {
            parent.navigationController?.pushViewController(vc, animated: true)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
