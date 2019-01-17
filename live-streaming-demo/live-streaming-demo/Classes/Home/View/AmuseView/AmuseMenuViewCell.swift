//
//  AmuseMenuViewCell.swift
//  live-streaming-demo
//
//  Created by Zijia Zhai on 1/17/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit
private let cellID = "cellID"
class AmuseMenuViewCell: UICollectionViewCell {
    
    var groups : [AnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }
}


extension AmuseMenuViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ZJPrint(groups?.count)
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.求出Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GameCell
//        cell.backgroundColor = .red
        // 2.给Cell设置数据
        cell.baseGame = groups![indexPath.item]
//        cell.clipsToBounds = true
        
        return cell
    }
}
