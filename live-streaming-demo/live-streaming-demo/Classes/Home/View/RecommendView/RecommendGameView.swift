//
//  RecommendGameView.swift
//  live-streaming-demo
//
//  Created by zijia on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let zjEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: self!.frame.size.height)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: self!.bounds, collectionViewLayout: layout)
        cv.dataSource = self
        cv.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        cv.contentInset = UIEdgeInsets(top: 0, left: zjEdgeInsetMargin, bottom: 0, right: zjEdgeInsetMargin)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RecommendGameView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GameCell
        if indexPath.item%2 == 0{
            cell.backgroundColor = .green
        }else{
            cell.backgroundColor = .black
        }
        return cell
    }
}
