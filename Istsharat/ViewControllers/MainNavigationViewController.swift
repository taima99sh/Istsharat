//
//  MainNavigationViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

  }

extension MainNavigationViewController {
    
    func setupView() {
        AppDelegate.shared.rootNavigationViewController = self
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    func localized() {
    }
    
    func setupData() {
    }
    
    func fetchData() {
    }
}
