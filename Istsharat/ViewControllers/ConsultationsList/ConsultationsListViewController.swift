//
//  ConsultationsListViewController.swift
//  Istsharat
//
//  Created by taima on 2/3/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class ConsultationsListViewController: UIViewController {
    
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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
extension ConsultationsListViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension ConsultationsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationsListTableViewCell", for: indexPath) as! ConsultationsListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
