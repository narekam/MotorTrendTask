//
//  CatFavoritesListViewController.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 12/10/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatFavoritesListViewController: UIViewController {
    
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
        
        networkManager.getFavorites() { (resultArray) in
            self.catImageList = resultArray
            self.tableView.reloadData()
        }
    }
}

extension CatFavoritesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CatImageTableViewCell
        
        let catImage = catImageList[indexPath.row]
        cell.catImageModel = catImage
        cell.likeDelegate = self
        cell.mode = .favoritesMode
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catImageList.count
    }
}

extension CatFavoritesListViewController: LikeDelegate {
    func likePressed(id: String) {
        networkManager.removeFavorite(id: id) { (success) in
            if success {
                print("Removed from favorites")
            } else {
                print("Smth went wrong")
            }
            
            self.fetchData()
        }
    }
}
