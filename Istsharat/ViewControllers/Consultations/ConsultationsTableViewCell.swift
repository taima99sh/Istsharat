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
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDtae: UILabel!
    
    
    
    var object: Question?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnDetails(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "QuestionDetailsViewController") as! QuestionDetailsViewController
        if let obj = self.object {
            vc.id = obj.id ?? 0
        }
        if let parent = self.parentViewController as? ConsultationsViewController {
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        if let obj = self.object {
            self.lblTitle.text = obj.title ?? "بدون عنوان"
            self.lblStatus.text = (obj.status ?? 2) == 0 ? "لم يتم الرد" : "تم الرد"
            self.lblDtae.text = obj.createdAt.toDate(customFormat: "MM/dd/yyyy").toString(customFormat: "MM/dd/yyyy") ?? "بدون عنوان"
        }
    }
    

}
