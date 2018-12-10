//
//  CatListBaseViewController.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 12/10/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatListBaseViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let cellIdentifier = "CatImageTableViewCell"
    private var catImageList = [CatImageModel]()
    private let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    func fetchData() {
        catImageList.removeAll()
        tableView.reloadData()
    }
}
