//
//  AlbumTableView.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation


//
//  UserTableView.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class AlbumTableView:UITableView{
    
    var albums:[User] = [User]()
    weak var vcDelegate:AlbumVCDelegate?
    
    func setup(user:User){
        let idStr:String = String(user.id)
        let urlString = "https://jsonplaceholder.typicode.com/users/{user_id}/albums".replacingOccurrences(of: "{user_id}", with: idStr)
        print(urlString)
        let url = URL(fileURLWithPath: urlString)
        
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                let albumJson = JSON(data: data!)
                print(albumJson)
                
            }
            
            }.resume()
//        self.dataSource = self
//        self.delegate = self
//        
//        
//        let data:Data = try! Data(contentsOf: userJsonURL)
//        let json = JSON(data: data)
//        for (_,subJson):(String, JSON) in json {
//            albums.append(User(userData: subJson))
//        }
        
    }
}


extension AlbumTableView:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")!
        let user = albums[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
}


extension AlbumTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.vcDelegate?.pushToAlbumList(withUser: albums[indexPath.row])
    }
}

