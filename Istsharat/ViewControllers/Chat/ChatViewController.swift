//
//  ChatViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension ChatViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
