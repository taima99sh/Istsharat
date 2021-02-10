//
//  ConsultationsViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import SwiftyJSON

class ConsultationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: MyTableView!
    
    @IBOutlet weak var btnAddNew: UIButton!
    
    var tableArr: [Question] = []
    
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.fetchData()
    }
    
    @IBAction func btnAddNew(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AskConsultationViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension ConsultationsViewController {
    func setupView(){
        self.tableView.refreshcontrol.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
    }
    func localized(){}
    func setupData(){}
    @objc func fetchData(){
        let id = UserProfile.shared.userID ?? 0
        let request = BaseRequest()
        request.url = "ListQuestions?u_id=\(id)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = QuestionsModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            self.tableArr = data.questions
            self.tableView.refreshcontrol.endRefreshing()
            //EmptyData
            self.tableView.EmptyDataImage = "emptyTable".image_
            self.tableView.EmptyDataTitle = "لاتوجد أسئلة"
            self.tableView.reloadData()
            print(data)
        }
    }
}

extension ConsultationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationsTableViewCell", for: indexPath) as! ConsultationsTableViewCell
        cell.object = self.tableArr[indexPath.row]
        cell.configureCell()
        return cell
    }
    
}
