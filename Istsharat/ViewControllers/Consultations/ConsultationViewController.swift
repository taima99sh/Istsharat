//
//  ConsultationViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ConsultationViewController: UIViewController {
    
    @IBOutlet weak var lblConsultationTitle: UILabel!
    
    @IBOutlet weak var lblConsultationType: UILabel!
    
    @IBOutlet weak var txtConsultation: UITextView!
    
    @IBOutlet weak var btnChat: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnConsultation(_ sender: Any) {
    }
    
}
extension ConsultationViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}