//
//  RecommendCycleView.swift
//  live-streaming-demo
//
//  Created by Zijia Zhai on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit


private let cellId = "cellId"

class RecommendCycleView: UIView {
    
    var cycleModels = [CycleModel]() {
        didSet {
            ZJPrint(cycleModels)
            collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}


// MARK:- setupUI
extension RecommendCycleView{
    fileprivate func setupUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "CycleCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
    }
}



extension RecommendCycleView{
    class func recommendCycleView() -> RecommendCycleView{
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}


extension RecommendCycleView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycleModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CycleCell
        ZJPrint(cycleModels)
        ZJPrint(cycleModels[1].title)
        ZJPrint(cycleModels[1].room)
        ZJPrint(cycleModels[1].pic_url)
        cell.cycleModel = cycleModels[indexPath.item]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: zjScreenW, height: self.frame.size.height)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
