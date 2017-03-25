//
//  AlbumListViewController.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewController: UIViewController {
    
    
    @IBOutlet weak var albumTableView: AlbumTableView!{
        didSet{
            albumTableView.vcDelegate = self
            albumTableView.setup(user: user)
        }
    }
    
    var user:User!
}


protocol AlbumVCDelegate:class {
    func pushToAlGalleryViewController(withAlbum album:Album)
}

extension AlbumListViewController:AlbumVCDelegate{
    func pushToAlGalleryViewController(withAlbum album:Album) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GalleryViewController") as? GalleryViewController {
            viewController.album = album
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
