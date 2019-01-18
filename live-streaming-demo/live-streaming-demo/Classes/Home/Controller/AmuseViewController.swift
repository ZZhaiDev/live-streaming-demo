//
//  AmuseViewController.swift
//  live-streaming-demo
//
//  Created by zijia on 12/5/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

private let zjMenuViewH : CGFloat = 200
private let zjHeaderViewH : CGFloat = 50
private let normalCellId = "normalCellId"
private let zjHeaderViewID = "zjHeaderViewID"
private let zjItemMargin : CGFloat = 10

let zjNormalItemW = (zjScreenW - 3 * zjItemMargin) / 2
let zjNormalItemH = zjNormalItemW * 3 / 4


class AmuseViewController: BaseViewController {
    
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    let amuseMenuView: AmuseMenuView = {
        let amv = AmuseMenuView.amuseMenuView()
        amv.frame = CGRect(x: 0, y: -zjMenuViewH, width: zjScreenW, height: zjMenuViewH)
        return amv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: zjScreenW, height: zjHeaderViewH)
        layout.itemSize = CGSize(width: zjNormalItemW, height: zjNormalItemH)
        layout.minimumInteritemSpacing = zjItemMargin
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: zjItemMargin, bottom: 0, right: zjItemMargin)
        
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .white
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        cv.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: normalCellId)
        cv.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: zjHeaderViewID)
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
}


extension AmuseViewController{
    override func setupUI(){
//        self.view.backgroundColor = UIColor.black
        contentView = collectionView
        collectionView.contentInset = UIEdgeInsets(top: zjMenuViewH, left: 0, bottom: 0, right: 0)
        view.addSubview(collectionView)
        collectionView.addSubview(amuseMenuView)
        
        super.setupUI()
    }
    
    fileprivate func loadData(){
        amuseVM.loadAmuseData {
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.amuseMenuView.groups = tempGroups
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}


extension AmuseViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        ZJPrint(amuseVM.anchorGroups.count)
        return amuseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amuseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalCellId, for: indexPath) as! CollectionNormalCell
        cell.anchor = amuseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: zjHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        // 2.给HeaderView设置数据
        headerView.group = amuseVM.anchorGroups[indexPath.section]
        
        return headerView
    }
}
