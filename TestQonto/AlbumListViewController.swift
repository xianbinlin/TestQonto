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
    func pushToAlbumList(withUser user:User)
}

extension AlbumListViewController:AlbumVCDelegate{
    func pushToAlbumList(withUser user:User) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlbumListViewController") as? AlbumListViewController {
            viewController.user = user
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
