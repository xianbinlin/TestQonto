//
//  GalleryCollectionView.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GalleryCollectionView: UICollectionView {
    
    var photos:[GalleryPhoto] = [GalleryPhoto]()
    
    func setup(album:Album){
        self.dataSource =  self
        self.delegate = self
        
        
        let idStr:String = String(album.id)
        let urlString = "https://jsonplaceholder.typicode.com/albums/{album_id}/photos".replacingOccurrences(of: "{album_id}", with: idStr)
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                // TODO: check data nil?
                let photoJson =  JSON(data!)
                for (_,photoData):(String,JSON) in photoJson{
                    self.photos.append(GalleryPhoto(photoData: photoData))
                }
                
                DispatchQueue.main.async {
                    self.reloadData()
                }
                
                
            }
            
            }.resume()
        
    }
    
}


extension GalleryCollectionView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        let photo = self.photos[indexPath.row]
        let urlStr = photo.thumbnailUrl
        let url = URL(string:urlStr)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                // TODO: check data nil?
                DispatchQueue.main.async {
                    cell.backgroundView = UIImageView(image: UIImage(data: data!))
                    //self.reloadData()
                }
            }
        }.resume()

        
        return cell
    }
}


extension GalleryCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}


