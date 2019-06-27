//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class CollectionNormalCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!

    var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else { return }
            var onlineStr: String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: UIControl.State())
            nickNameLabel.text = anchor.nickname
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            ZJPrint(iconURL)
            iconImageView.kf.setImage(with: iconURL)
            roomNameLabel.text = anchor.room_name
        }
    }

}
