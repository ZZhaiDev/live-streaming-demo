//
//  PageTitleView.swift
//  live-streaming-demo
//
//  Created by zijia on 12/4/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    fileprivate var titles: [String]
    
    fileprivate lazy var scrollView: UIScrollView = {
       let sc = UIScrollView()
//        sc.showsVerticalScrollIndicator = false
//        sc.scrollsToTop = false
//        sc.bounces = false
        return sc
    }()

    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageTitleView{
    fileprivate func setupUI(){
    
    }
}
