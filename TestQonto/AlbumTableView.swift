//
//  AlbumTableView.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//


import Foundation
import UIKit
import SwiftyJSON

class AlbumTableView:UITableView{
    
    var albums:[Album] = [Album]()
    weak var vcDelegate:AlbumVCDelegate?
    
    func setup(user:User){
        
        self.dataSource = self
        self.delegate = self
        
        let idStr:String = String(user.id)
        let urlString = "https://jsonplaceholder.typicode.com/users/{user_id}/albums".replacingOccurrences(of: "{user_id}", with: idStr)
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                // TODO: check data nil?
                let albumJson =  JSON(data!)
                for (_,albumdata):(String,JSON) in albumJson{
                    self.albums.append(Album(albumData: albumdata))
                }
                
                DispatchQueue.main.async {
                    self.reloadData()
                }
                
                
            }
            
            }.resume()
    }
}


extension AlbumTableView:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell")!
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.title
        cell.detailTextLabel?.text = "\(album.userId) : \(album.id)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
}


extension AlbumTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.vcDelegate?.pushToAlGalleryViewController(withAlbum: albums[indexPath.row])
    }
}

