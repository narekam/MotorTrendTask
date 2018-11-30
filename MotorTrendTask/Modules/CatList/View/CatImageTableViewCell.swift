//
//  CatImageTableViewCell.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/26/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

class CatImageTableViewCell: UITableViewCell {

    @IBOutlet var catImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    @IBAction func likePressed(sender: AnyObject) {
    }
    
}
