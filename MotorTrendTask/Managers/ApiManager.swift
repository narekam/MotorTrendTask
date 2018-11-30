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
}

extension CatAPI: TargetType {
    static let apiKey = "4702ec43-ccd0-430e-9d6b-3e168d295139"
    static let uderId = "ydlz82"
    
    var baseURL: URL {
        guard let url = URL.init(string: "https://api.thecatapi.com/v1") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getImages(_, _):
            return "/images/search"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getImages(let limit, let page):
            return .requestParameters(parameters: ["limit": limit, "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "x-api-key": CatAPI.apiKey]
    }
}
