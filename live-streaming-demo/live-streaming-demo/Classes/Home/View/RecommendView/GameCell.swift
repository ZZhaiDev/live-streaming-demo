//
//  GameCell.swift
//  live-streaming-demo
//
//  Created by zijia on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!

    var baseGame: BaseGameModel? {
        didSet {
            labelView.text = baseGame?.tag_name
            if let iconURL = URL(string: baseGame?.icon_url ?? "") {
                imageView.kf.setImage(with: iconURL)
            } else {
                imageView.image = UIImage(named: "home_more_btn")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 22.5
        imageView.layer.masksToBounds = true
    }

}
