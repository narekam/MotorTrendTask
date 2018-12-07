//
//  NetworkManager.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/23/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

protocol Networkable {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct NetworkManager: Networkable {
    let provider = MoyaProvider<CatAPI>()
    
    func getImages(limit: Int, page: Int, completion: @escaping ([CatImageModel])->()) {
        provider.request(CatAPI.getImages(limit: limit, page: page)) { result in
            switch result {
            case let .success(response):
                let data = response.data
                var catImages: [CatImageModel] = []
                
                if let json = try? JSON(data: data) {
                    for catImage in json.arrayValue {
                        let aCatImage = CatImageModel.init(id: catImage["id"].stringValue, url: catImage["url"].stringValue)
                        catImages.append(aCatImage)
                    }
                    
                    print(json)
                    completion(catImages)
                }
                
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage)->()) {
        provider.request(CatAPI.getImage(urlString: urlString)) { result in
            switch result {
            case let .success(response):
                if let image = UIImage.init(data: response.data) {
                    completion(image)
                }
                
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }
}



