//
//  UserModel.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//
import MapKit
import SwiftyJSON

struct Address {
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo:CLLocationCoordinate2D? = nil

    init(addressData:JSON) {
        self.street = addressData["street"].string!
        self.suite = addressData["suite"].string!
        self.city = addressData["city"].string!
        self.zipcode = addressData["zipcode"].string!
        let geo:JSON = addressData["geo"]
        // TODO: read lat fail
        //let lat = geo["lat"].number!
        //let lng = geo["lng"].number!
//        self.geo = CLLocationCoordinate2DMake(lat, lng)
    }
    
}

struct Company {
    let name:String
    let catchPhrase:String
    let bs:String
    init(companyData:JSON) {
        self.name = companyData["name"].string!
        self.catchPhrase = companyData["catchPhrase"].string!
        self.bs = companyData["bs"].string!
    }
}


struct User {
    let id:Int
    let name:String
    let username:String
    let email:String
    let address:Address
    let phone:String
    let website:String
    let company:Company
    
   
}

extension User{
    init(userData:JSON) {
        self.id = userData["id"].int!
        self.name = userData["name"].string!
        self.username = userData["username"].string!
        self.email = userData["email"].string!
        self.address = Address(addressData: userData["address"])
        self.phone = userData["phone"].string!
        self.website = userData["website"].string!
        self.company = Company(companyData: userData["company"])
        
    }
}


//{
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//        "street": "Kulas Light",
//        "suite": "Apt. 556",
//        "city": "Gwenborough",
//        "zipcode": "92998-3874",
//        "geo": {
//            "lat": "-37.3159",
//            "lng": "81.1496"
//        }
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//        "name": "Romaguera-Crona",
//        "catchPhrase": "Multi-layered client-server neural-net",
//        "bs": "harness real-time e-markets"
//}
