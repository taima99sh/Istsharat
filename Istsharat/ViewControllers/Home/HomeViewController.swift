//
//  HomeViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    
    @IBOutlet weak var tableView: MyTableView!
    
    //var tableDataArr: [[CategoryHome]] = [[]]
    var sectionData: [CategoryHome] = []
    var adv: [String] = []

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
        sideMenuController?.isRightViewSwipeGestureEnabled = true
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
        
        tableView.register(UINib.init(nibName: "AdvsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvsTableViewCell")
    }
    func localized(){}
    func setupData(){
        self.tableView.refreshcontrol.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
    }
    @objc func fetchData(){
        let request = BaseRequest()
        request.url = "Home"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = HomeModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            if let categories = data.categories {
                self.sectionData = categories.filter { $0.topics.count != 0 }
            }
            self.tableView.refreshcontrol.endRefreshing()
            self.tableView.EmptyDataImage = "emptyTable".image_
            self.tableView.EmptyDataTitle = "لاتوجد استشارات"
            self.tableView.reloadData()
            print(data)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionData.count 
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         self.sectionData[section].topics.count > 3 ? 3 : self.sectionData[section].topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 0 && !self.adv.isEmpty {
             let cell = tableView.dequeueReusableCell(withIdentifier: "AdvsTableViewCell", for: indexPath) as! AdvsTableViewCell
            //to do
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildHomeTableViewCell", for: indexPath) as! ChildHomeTableViewCell
        cell.viewColor.backgroundColor = indexPath.row % 2 == 0 ? "#ECECEC".color_ : .white
        cell.lblNum.text = "\(indexPath.row + 1)"
        cell.object = self.sectionData[indexPath.section].topics[indexPath.row]
        cell.configureCell()
        return cell
    }
    
     func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderHomeTableView()
        view.lblTitle.text = self.sectionData[section].cArName ?? "استشارات"
       return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = FooterHomeTableView()
        view.id = self.sectionData[section].cId ?? 0
        view.NavTitle = self.sectionData[section].cArName ?? "استشارات"
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        80
    }
}
