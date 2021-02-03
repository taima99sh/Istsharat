//
//  MenuViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var tableView: GeneralTableView!
    
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
}
extension MenuViewController {
    func setupView(){
        tableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }
    func localized(){}
    func setupData(){
        tableView.generalRowHeight = 55
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.home, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.categories, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.chat, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.search, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.addresses, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.consultations, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.profile, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "MenuTableViewCell", object: Constant.MenuItems.SignOut, rowHeight: nil))
    }
    func fetchData(){}
}
