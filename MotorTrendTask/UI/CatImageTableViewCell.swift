//
//  CatImageTableViewCell.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/26/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatImageTableViewCell: UITableViewCell {

    @IBOutlet var catImageView: CatImageView!
    @IBOutlet var likeButton: UIButton!
    
    weak var likeDelegate: LikeDelegate?
    
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
        if let imageId = catImageModel?.id {
            likeDelegate?.likePressed(methodType: LikeMethodType.addLike, imageId: imageId)
        }
    }
}
