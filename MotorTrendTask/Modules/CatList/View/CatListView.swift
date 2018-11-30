//
//  CatListViewController.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/26/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatListView: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private let cellIdentifier = "CatImageTableViewCell"
    private var catImageList = [CatImageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension CatListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
//        let fruit = fruitList[indexPath.row]
//        cell.textLabel?.text = fruit.name
//        cell.detailTextLabel?.text = fruit.vitamin
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catImageList.count
    }
}
