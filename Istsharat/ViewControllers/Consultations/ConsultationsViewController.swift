//
//  ConsultationsViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ConsultationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnAddNew: UIButton!
    
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
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ConsultationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationsTableViewCell", for: indexPath) as! ConsultationsTableViewCell
        return cell
    }
    
}
