//
//  CycleCell.swift
//  live-streaming-demo
//
//  Created by Zijia Zhai on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit
import Kingfisher

class CycleCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var cycleModel : CycleModel? {
        didSet {
            if let cycle = cycleModel{
                titleLabel.text = cycle.title
                ZJPrint(titleLabel.text)
                let iconURL = URL(string: cycle.pic_url)
                ZJPrint(iconURL)
                imageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"))
                
            }
            
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
