//
//  PageContentView.swift
//  live-streaming-demo
//
//  Created by zijia on 12/5/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class PageContentView: UIView {
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = self.bounds.size
        
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.scrollsToTop = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageContentView{
    fileprivate func setupUI(){
        addSubview(collectionView)
    }
}


// mark: --
extension PageContentView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
}
