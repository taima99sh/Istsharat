//
//  LGSideViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import LGSideMenuController

class LGSideViewController: LGSideMenuController {
    
    let rootVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationViewController") 
    
    let rightVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MenuViewController")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
}

extension LGSideViewController {
    
    func setupView() {
        self.rootViewController = self.rootVC
        self.rightViewController = self.rightVC
        self.rightViewWidth = UIScreen.main.bounds.size.width * 0.8
//        self.rightViewPresentationStyle = .slideBelow
    }
     
    func localized() {
    }
    
    func setupData() {
    }
    
    func fetchData() {
    }
}
