//
//  CatListViewController.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/26/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatListViewController: UIViewController {

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
    
    private func fetchData() {
        catImageList.removeAll()
        tableView.reloadData()
        
        networkManager.getImages(limit: 20, page: 0) { (resultArray) in
            self.catImageList = resultArray
            self.tableView.reloadData()
        }
    }
}

extension CatListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CatImageTableViewCell
        
        let catImage = catImageList[indexPath.row]
        cell.catImageModel = catImage
        cell.likeDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catImageList.count
    }
}

extension CatListViewController: LikeDelegate {
    func likePressed(imageId: String) {
        networkManager.addFavorite(imageId: imageId) { (success) in
            if success {
                print("Added to favorites")
            } else {
                print("Smth went wrong")
            }
        }
    }
}
