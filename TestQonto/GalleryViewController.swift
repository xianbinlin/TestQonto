//
//  GalleryViewController.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController {
    
    var album:Album!
    
    @IBOutlet weak var galleryCollectionView: GalleryCollectionView!{
        didSet{
            galleryCollectionView.setup(album: self.album)
        }
    }
    
    
   
    
}


