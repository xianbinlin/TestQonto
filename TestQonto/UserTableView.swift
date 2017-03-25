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

class UserTableView:UITableView{
    
    var users:[User] = [User]()
    weak var vcDelegate:UserVCDelegate?
    
    func setup(userJsonURL:URL){
        
        self.dataSource = self
        self.delegate = self
        
        
        let data:Data = try! Data(contentsOf: userJsonURL)
        let json = JSON(data: data)
        for (_,subJson):(String, JSON) in json {
            users.append(User(userData: subJson))
        }
        
    }
}


extension UserTableView:UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")!
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}


extension UserTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.vcDelegate?.pushToAlbumListViewController(withUser: users[indexPath.row])
    }
}

