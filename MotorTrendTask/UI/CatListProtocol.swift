//
//  CatListProtocol.swift
//  MotorTrendTask
//
//  Created by Narek Fidanyan on 12/10/18.
//  Copyright © 2018 Narek Fidanyan. All rights reserved.
//

import Foundation

enum LikeMethodType {
    case addLike
    case removeLike
}


protocol LikeDelegate: AnyObject {
    func likePressed(methodType: LikeMethodType, imageId: String)
}
