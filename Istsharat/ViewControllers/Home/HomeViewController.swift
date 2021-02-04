//
//  HomeViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

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
extension HomeViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ChildHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildHomeTableViewCell")
        tableView.register(UINib.init(nibName: "HeaderHomeTableView", bundle: nil), forCellReuseIdentifier: "HeaderHomeTableView")
//        tableView.register(UINib.init(nibName: "FooterHomeTableView", bundle: nil), forCellReuseIdentifier: "FooterHomeTableView")
        
        self.parent?.navigationController?.navigationItem.title = "Home"
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildHomeTableViewCell", for: indexPath) as! ChildHomeTableViewCell
        cell.viewColor.backgroundColor = indexPath.row % 2 == 0 ? "#ECECEC".color_ : .white
        return cell
    }
    
     func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderHomeTableView()
       view.lblTitle.text = "استشارات صحية"
       return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = FooterHomeTableView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        80
    }
}
