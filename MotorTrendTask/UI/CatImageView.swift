//
//  CatImageView.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 12/6/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import UIKit

private let imageCache = NSCache<NSString, UIImage>()
private let networkManager = NetworkManager()

class CatImageView: UIImageView {
    var imageUrl: String?
    var activityIndicator = UIActivityIndicatorView(style: .gray)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        activityIndicator.center = center
        self.addSubview(activityIndicator)
    }
    
    func loadImageFromUrl(urlString: String) {
        image = nil
        
        imageUrl = urlString
        
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
        } else {
            startLoadingAnimation()
            networkManager.getImage(urlString: urlString) { (image) in
                self.stopLoadingAnimation()
                DispatchQueue.main.async {
                    if self.imageUrl == urlString {
                        self.image = image
                    }
                    
                    imageCache.setObject(image, forKey: urlString as NSString)
                }
            }
        }
    }
    
    func startLoadingAnimation() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func stopLoadingAnimation() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
