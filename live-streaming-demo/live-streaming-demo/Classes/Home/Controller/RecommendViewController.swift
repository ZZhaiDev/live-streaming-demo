//
//  RecommendViewController.swift
//  live-streaming-demo
//
//  Created by zijia on 12/5/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

//private let basicCellId  = "cellId"
private let zjPrettyCellID  = "zjPrettyCellID"
private let zjNormalCellID = "zjNormalCellID"
private let zjHeaderViewID = "zjHeaderViewID"
private let zjCycleViewH = zjScreenW * 3 / 8
private let zjGameViewH: CGFloat = 90
private let zjHeaderViewH: CGFloat = 50
private let zjItemMargin: CGFloat = 10
private let zjPrettyItemH = zjNormalItemW * 4 / 3

class RecommendViewController: BaseViewController {
    fileprivate lazy var recommendVM: RecommendViewModel = RecommendViewModel()
    let cycleView: RecommendCycleView = {
       let cv = RecommendCycleView.recommendCycleView()
        cv.frame = CGRect(x: 0, y: -(zjCycleViewH+zjGameViewH), width: zjScreenW, height: zjCycleViewH)
        return cv
    }()

    let gameView: RecommendGameView = {
       let gv = RecommendGameView(frame: CGRect(x: 0, y: -zjGameViewH, width: zjScreenW, height: zjGameViewH))
        return gv
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: zjScreenW, height: zjHeaderViewH)
        layout.itemSize = CGSize(width: zjNormalItemW, height: zjNormalItemH)
        layout.minimumInteritemSpacing = zjItemMargin
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: zjItemMargin, bottom: 0, right: zjItemMargin)
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        cv.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: zjPrettyCellID)
        cv.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: zjNormalCellID)
        cv.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: zjHeaderViewID)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    override func setupUI() {
        contentView = collectionView
        collectionView.contentInset = UIEdgeInsets(top: zjCycleViewH + zjGameViewH, left: 0, bottom: 0, right: 0)
        self.view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        collectionView.backgroundColor = .clear
        super.setupUI()
    }

}

// MARK: - UISETUP
extension RecommendViewController {
    fileprivate func loadData() {
        recommendVM.requestData {
            self.collectionView.reloadData()
            var groups = self.recommendVM.anchorGroups
            // 2.1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            // 2.2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            self.gameView.groups = groups
            self.loadDataFinished()
        }
        recommendVM.requestCycleData {
            ZJPrint(self.recommendVM.cycleModels)
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

// MARK: - collectionView dataSource
extension RecommendViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendVM.anchorGroups[section].anchors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            // 1.取出PrettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: zjPrettyCellID, for: indexPath) as! CollectionPrettyCell
            // 2.设置数据
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return prettyCell
        } else {
            // 1.取出Cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: zjNormalCellID, for: indexPath) as! CollectionNormalCell
            // 2.给cell设置数据
            cell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: zjHeaderViewID, for: indexPath) as! CollectionHeaderView
        // 2.给HeaderView设置数据
        headerView.group = recommendVM.anchorGroups[indexPath.section]
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: zjNormalItemW, height: zjPrettyItemH)
        }
        return CGSize(width: zjNormalItemW, height: zjNormalItemH)
    }
}
