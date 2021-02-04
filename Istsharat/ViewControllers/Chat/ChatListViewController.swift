//
//  ChatListViewController.swift
//  Istsharat
//
//  Created by taima on 2/1/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import LGSideMenuController

class ChatListViewController: UIViewController {
    
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
extension ChatListViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        if indexPath.row % 2 == 0 {
            cell.haveNewMessage = false
        } else {
           cell.haveNewMessage = true
        }
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ChatViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


