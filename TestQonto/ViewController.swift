//
//  ViewController.swift
//  TestQonto
//
//  Created by xianbin lin on 2017/3/25.
//  Copyright © 2017年 lin. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    
    @IBOutlet weak var userTableView: UserTableView!{
        didSet{
            userTableView.vcDelegate = self
            let url = Bundle.main.url(forResource: "users", withExtension: "json")
            userTableView.setup(userJsonURL: url!)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

protocol UserVCDelegate:class {
    func pushToAlbumList(withUser user:User)
}

extension ViewController:UserVCDelegate{
    func pushToAlbumList(withUser user:User) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlbumListViewController") as? AlbumListViewController {
            viewController.user = user
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}









