//
//  CatImageView.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 12/6/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
let networkManager = NetworkManager()

class CatImageView: UIImageView {
    var imageUrl: String?
    
    func loadImageFromUrl(urlString: String) {
        image = nil
        
        imageUrl = urlString
        
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
        } else {
            networkManager.getImage(urlString: urlString) { (image) in
                DispatchQueue.main.async {
                    if self.imageUrl == urlString {
                        self.image = image
                    }
                    
                    imageCache.setObject(image, forKey: urlString as NSString)
                }
            }
        }
    }
}
