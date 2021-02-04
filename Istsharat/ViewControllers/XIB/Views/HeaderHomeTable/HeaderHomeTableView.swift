//
//  File.swift
//  Istsharat
//
//  Created by taima on 2/4/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class HeaderHomeTableView: UIView {
    let kCONTENT_XIB_NAME = "HeaderHomeTableView"
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var view1: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        view1.layer.cornerRadius = 5
        view1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        contentView.fixInView(self)
        
    }
    
    class func instanceFromNib() -> HeaderHomeTableView {
        return UINib(nibName: "HeaderHomeTableView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderHomeTableView
    }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
