//
//  CatImageTableViewCell.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/26/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

enum CatImageTableViewCellMode {
    case normalMode
    case favoritesMode
}

class CatImageTableViewCell: UITableViewCell {

    @IBOutlet var catImageView: CatImageView!
    @IBOutlet var likeButton: UIButton!
    
    weak var likeDelegate: LikeDelegate?
    var mode: CatImageTableViewCellMode = .normalMode
    
    public var catImageModel: CatImageModel? {
        didSet {
            if let imageUrl = catImageModel?.url {
                catImageView.loadImageFromUrl(urlString: imageUrl)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func likePressed(sender: AnyObject) {
        switch mode {
        case .favoritesMode:
            if let favoriteId = catImageModel?.favoriteId {
                likeDelegate?.likePressed(id: favoriteId)
            }
        default:
            if let imageId = catImageModel?.id {
                likeDelegate?.likePressed(id: imageId)
            }
        }
    }
}
