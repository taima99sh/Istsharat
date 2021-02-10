//
//  ChatListViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import LGSideMenuController
import SwiftyJSON

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var tableView: MyTableView!
    
    var tableArr: [ChatSession] = []
    
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
        fetchData()
    }
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
}
extension ChatListViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
        self.tableView.refreshcontrol.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
    }
    func localized(){}
    func setupData(){}
    @objc func fetchData(){
        let request = BaseRequest()
        let id = UserProfile.shared.userID ?? 0
        request.url = "ListChats?u_id=\(id)&u_type=\(0)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = ChatSessionsModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: "error")
                return
            }
            self.tableArr = data.chatSessions
            self.tableView.refreshcontrol.endRefreshing()
            //EmptyData
            self.tableView.EmptyDataImage = "emptyTable".image_
            self.tableView.EmptyDataTitle = "لاتوجد محادثات"
            self.tableView.reloadData()
            print(data)
        }
    }
}

extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        cell.object = tableArr[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        vc.chatId = tableArr[indexPath.row].chatId ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


