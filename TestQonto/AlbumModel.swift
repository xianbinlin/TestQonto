//
//  AlbumModel.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Album {
    let id:Int
    let userId:Int
    let title:String
}

extension Album{
    init(albumData:JSON) {
        self.id = albumData["id"].int!
        self.userId = albumData["userId"].int!
        self.title = albumData["title"].string!
    }
}

//"id" : 2,
//"userId" : 1,
//"title" : "sunt qui excepturi placeat culpa"
