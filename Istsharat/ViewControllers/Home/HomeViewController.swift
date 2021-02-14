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
    var adv1: [String] = []
    var count: Int = 0

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
                //self.sectionData = categories
                //self.tableView.reloadData()
            }
            self.getAdv()
            self.tableView.refreshcontrol.endRefreshing()
            self.tableView.reloadData()
            print(data)
        }
    }
    
    func getAdv() {
        let request = BaseRequest()
        request.url = "Advs"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = AdvsModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            if let advs = data.advs {
                for adv in advs {
                    self.adv.append(adv.pThumb)
                }
            }
            self.tableView.refreshcontrol.endRefreshing()
            self.tableView.reloadData()
            self.tableView.EmptyDataImage = "emptyTable".image_
                       self.tableView.EmptyDataTitle = "لاتوجد استشارات"
            print(data)
    }
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionData.count + self.adv.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section % 3 == 0 {
            return 1
        } else {
            
        }
        
        return self.sectionData[(section - section/3) - 1 ].topics.count > 3 ? 3 : self.sectionData[(section - section/3) - 1].topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 3 == 0 && self.adv.count >= (indexPath.section / 3) + 1 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "AdvsTableViewCell", for: indexPath) as! AdvsTableViewCell
            cell.img = adv[indexPath.section / 3]
            cell.configureCell()
            return cell
            //to do
        }
       if (indexPath.section) % 3 != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChildHomeTableViewCell", for: indexPath) as! ChildHomeTableViewCell
            cell.viewColor.backgroundColor = indexPath.row % 2 == 0 ? "#ECECEC".color_ : .white
            cell.lblNum.text = "\(indexPath.row + 1)"
            cell.object = self.sectionData[(indexPath.section - indexPath.section/3) - 1].topics[indexPath.row]
            cell.configureCell()
            return cell
        }
        
        return UITableViewCell()
        
            }
    
     func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderHomeTableView()
        if (section) % 3 != 0  {
            view.lblTitle.text = self.sectionData[(section - section/3) - 1].cArName ?? "استشارات"
        }
       return view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = FooterHomeTableView()
        if (section) % 3 != 0 {
            view.id = self.sectionData[(section - section/3) - 1].cId ?? 0
            view.NavTitle = self.sectionData[(section - section/3) - 1].cArName ?? "استشارات"
        }

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section % 3 == 0  {
            return CGFloat.leastNonzeroMagnitude
        }
       return 40
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section % 3 == 0    {
            return CGFloat.leastNonzeroMagnitude
        }
       return 70
    }
    
}
