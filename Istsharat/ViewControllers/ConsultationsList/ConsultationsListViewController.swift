//
//  ConsultationsListViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import SwiftyJSON

class ConsultationsListViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    
    @IBOutlet weak var tableView: MyTableView!
    
    var tableArr: [Page] = []
    
    var id: Int?
    var NavTitle = "استشارات"

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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
extension ConsultationsListViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    func localized(){}
    func setupData(){
        self.tableView.refreshcontrol.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
        self.lblNavTitle.text = self.NavTitle
    }
    @objc func fetchData(){
        let request = BaseRequest()
        request.url = "getPagesOfCategory?c_id=\(self.id ?? 0)&lang=0"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = PageOfCategory.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            self.tableArr = data.pages
            self.tableView.refreshcontrol.endRefreshing()
            //EmptyData
            self.tableView.EmptyDataImage = "emptyTable".image_
            self.tableView.EmptyDataTitle = "لاتوجد استشارات"
            self.tableView.reloadData()
            print(data)
        }
    }
}

extension ConsultationsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationsListTableViewCell", for: indexPath) as! ConsultationsListTableViewCell
        cell.object = self.tableArr[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationViewController") as! ConsultationViewController
        vc.id = self.tableArr[indexPath.row].pId ?? 0
        vc.catID = self.id ?? 0
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
