//
//  ApiManager.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 11/23/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import Foundation
import Moya

enum CatAPI {
    case getImages(limit: Int, page: Int)
    case getImage(urlString: String)
    case getFavorites
    case addFavorite(imageId: String)
}

extension CatAPI: TargetType {
    static let apiKey = "4702ec43-ccd0-430e-9d6b-3e168d295139"
    static let userId = "ydlz82"
    
    var baseURL: URL {
        switch self {
        case .getImages(_, _), .getFavorites, .addFavorite(_):
            return URL.init(string: "https://api.thecatapi.com/v1")!
        case .getImage(let urlString):
            return URL.init(string: urlString)!
        }
    }
    
    var path: String {
        switch self {
        case .getImages(_, _):
            return "/images/search"
        case .getImage(_):
            return ""
        case .getFavorites, .addFavorite(_):
            return "/favourites"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getImages(_, _), .getImage(_), .getFavorites:
            return .get
        case .addFavorite(_):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getImages(let limit, let page):
            return .requestParameters(parameters: ["limit": limit, "page": page], encoding: URLEncoding.queryString)
        case .getImage(_), .getFavorites:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        case .addFavorite(let imageId):
            return .requestParameters(parameters: ["image_id": "uk0SrrBbQ"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "x-api-key": CatAPI.apiKey]
    }
}
