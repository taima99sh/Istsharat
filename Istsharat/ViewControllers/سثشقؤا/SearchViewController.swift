//
//  SearchViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON

class SearchViewController: UIViewController {
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var tableView: MyTableView!
    
    @IBOutlet weak var btnType: UIButton!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    
    let chooseDropDown = DropDown()
    
    var arrType = ["نفسية", "صحية", "عائلية", "حياتية"]
    var arrCatIds: [Int] = []
    var arrTableData: [Page] = []
    var cat: String = ""

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
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightViewAnimated(self)
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        guard validation() else {return}
        let request = BaseRequest()
        let key = self.txtSearch.text ?? ""
        let dic = [
            "srch_key": key,
            "srch_cat": self.cat ,
            "srch_lang": "0"
        ]
        request.url = "PagesSearch"
        request.method = .post
        request.parameters = dic
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = PageOfCategory.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            self.arrTableData = data.pages
            self.tableView.EmptyDataTitle = "لايوجد نتائج لبحثك"
            self.tableView.reloadData()
            print(data)
        }
    }
    
    func setupChooseDropDown() {
        chooseDropDown.anchorView = btnType
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: btnType.bounds.height)
        chooseDropDown.textFont = "Helvetica Neue W23 for SKY".toFont() ?? UIFont(name: "Arial", size: 14)!
        chooseDropDown.dataSource = self.arrType
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            self?.lblType.text = item
            if Connectivity.isConnectedToInternet { self?.cat = "\(self?.arrCatIds[index] ?? 0)"}
            
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
    func setupData(){
        self.tableView.EmptyDataImage = "SearchImage".image_
        self.tableView.EmptyDataTitle = "ابحث عن استشارة"
    }
    func fetchData(){
        Constant.getCategories(complete: { (categories) in
            self.arrType =  categories.map { $0.cArName }
            self.arrCatIds =  categories.map { $0.cId }
            self.chooseDropDown.dataSource = self.arrType
        }) { (message) in
            print(message)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.object = self.arrTableData[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationViewController") as! ConsultationViewController
        vc.id = self.arrTableData[indexPath.row].pId ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}

extension SearchViewController {
    func validation() -> Bool {
        if (txtSearch.isValidValue) == false {
            self.ErrorMessage(title: "", errorbody: "أدخل كلمة في مربع البحث")
            return false
        }
        return true
    }
}







