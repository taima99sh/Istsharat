//
//  SearchViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import DropDown

class SearchViewController: UIViewController {
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnType: UIButton!
    
    let chooseDropDown = DropDown()
    
    var arrType = ["نفسية", "صحية", "عائلية", "حياتية"]

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
    
    @IBAction func btnType(_ sender: UIButton) {
        chooseDropDown.show()
    }
    
    func setupChooseDropDown() {
        chooseDropDown.anchorView = btnType
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: btnType.bounds.height)
        chooseDropDown.textFont = "Helvetica Neue W23 for SKY".toFont() ?? UIFont(name: "Arial", size: 14)!
        chooseDropDown.dataSource = self.arrType
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblType.text = item
        }
    }
    
    func setupDefaultDropDown() {
        DropDown.setupDefaultAppearance()
        chooseDropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        chooseDropDown.customCellConfiguration = nil
    }
    
}
extension SearchViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        setupChooseDropDown()
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        return cell
    }
        
}



