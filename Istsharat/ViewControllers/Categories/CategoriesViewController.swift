//
//  CategoriesViewController.swift
//  Istsharat
//
//  Created by taima on 2/2/21.
//  Copyright © 2021 mac air. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var lblNavTitle: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshControl.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
        self.collectionView.refreshControl = refreshControl
        return refreshControl
    }()

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


extension CategoriesViewController {
    func setupView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    func localized(){}
    func setupData(){}
    @objc func fetchData(){
        Constant.getCategories(complete: { (categories) in
            print(categories)
            self.refreshControl.endRefreshing()
            self.collectionView.reloadData()
        }) { (message) in
            self.showErrorAlert(message: message)
        }
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constant.shared.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.object = Constant.shared.categories[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConsultationsListViewController") as! ConsultationsListViewController
        vc.id = Constant.shared.categories[indexPath.row].cId
        vc.NavTitle = Constant.shared.categories[indexPath.row].cArName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height: CGFloat = 165
        let width: CGFloat = (UIScreen.main.bounds.size.width - ( 30 + 30)) / 2
            return CGSize.init(width: width, height: width)
    }
}
