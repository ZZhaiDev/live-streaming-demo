//
//  RecommendViewController.swift
//  live-streaming-demo
//
//  Created by zijia on 12/5/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

private let basicCellId  = "cellId"
private let zjCycleViewH = zjScreenW * 3 / 8
private let zjGameViewH : CGFloat = 90


class RecommendViewController: UIViewController {
    
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
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
        layout.itemSize = CGSize(width: zjScreenW, height: 200)
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}


// MARK:- UISETUP
extension RecommendViewController{
    fileprivate func setupUI(){
        collectionView.contentInset = UIEdgeInsets(top: zjCycleViewH + zjGameViewH, left: 0, bottom: 0, right: 0)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: basicCellId)
        self.view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        collectionView.backgroundColor = .clear
    }
    
    fileprivate func loadData(){
        recommendVM.requestCycleData {
            ZJPrint(self.recommendVM.cycleModels)
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}



// MARK:- collectionView dataSource
extension RecommendViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: basicCellId, for: indexPath)
        
        if indexPath.item % 2 == 0{
            cell.backgroundColor = .blue
        }else{
            cell.backgroundColor = .black
        }
        return cell
    }
}
