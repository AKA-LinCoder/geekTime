//
//  ViewController.swift
//  geekTime
//
//  Created by lsaac on 2022/3/6.
//

import UIKit
import SnapKit
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let home = HomeViewController()
        home.tabBarItem.image = R.image.home()
        home.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        home.tabBarItem.title = "首页"
        home.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        let naVC = UINavigationController(rootViewController: home)
        self.addChild(naVC)
        let mine = MineViewController()
        mine.tabBarItem.image = R.image.mine()
        mine.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mine.tabBarItem.title = "我的"
        mine.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        let naMineVC = UINavigationController(rootViewController: mine)
        self.addChild(naMineVC)
 
        // Do any additional setup after loading the view.
    }
    
    @objc func didTap(){
        let loginVc = LoginiViewController()
        navigationController?.pushViewController(loginVc, animated: true)
    }


}

