//
//  HomeViewController.swift
//  live-streaming-demo
//
//  Created by zijia on 12/4/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageTitleView: PageTitleView = {
        let navigationMaxY: CGFloat = (navigationController?.navigationBar.frame.maxY) ?? 88
        let titleFrame = CGRect(x: 0, y: navigationMaxY, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


extension HomeViewController{
    fileprivate func setupUI(){
        setupNavigationBar()
        
        view.addSubview(pageTitleView)
        
    }
    
    fileprivate func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}
