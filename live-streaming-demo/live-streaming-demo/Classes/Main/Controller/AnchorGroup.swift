//
//  PageContentView.swift
//  live-streaming-demo
//
//  Created by zijia on 12/5/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

class AnchorGroup: BaseGameModel {
   @objc var room_list: [[String: NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
   @objc var icon_name: String = "home_header_normal"
   @objc lazy var anchors: [AnchorModel] = [AnchorModel]()
}
