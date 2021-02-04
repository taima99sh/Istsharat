//
//  FooterHomeTableView.swift
//  Istsharat
//
//  Created by taima on 2/4/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class FooterHomeTableView: UIView {
    let kCONTENT_XIB_NAME = "FooterHomeTableView"
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var view1: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @IBAction func btnMore(_ sender: Any) {
        if let parent = self.parentViewController as? HomeViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationsListViewController")
            
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        view1.layer.cornerRadius = 5
        view1.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        contentView.fixInView(self)
        
    }
    
    class func instanceFromNib() -> FooterHomeTableView {
        return UINib(nibName: "FooterHomeTableView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! FooterHomeTableView
    }
}
