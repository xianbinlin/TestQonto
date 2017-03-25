//
//  GalleryPhotoModel.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import SwiftyJSON


struct GalleryPhoto {
    let albumId:Int
    let id: Int
    let title:String
    let url:String
    let thumbnailUrl:String
}

extension GalleryPhoto{
    init(photoData:JSON) {
        self.albumId = photoData["albumId"].int!
        self.id = photoData["id"].int!
        self.title  = photoData["title"].string!
        self.url = photoData["url"].string!
        self.thumbnailUrl = photoData["thumbnailUrl"].string!
    }
}


//{
//    "albumId": 1,
//    "id": 1,
//    "title": "accusamus beatae ad facilis cum similique qui sunt",
//    "url": "http://placehold.it/600/92c952",
//    "thumbnailUrl": "http://placehold.it/150/92c952"
//},
