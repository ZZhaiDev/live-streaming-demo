//
//  GameModel.swift
//  live-streaming-demo
//
//  Created by zijia on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {

  @objc var tag_name: String = ""
  @objc var icon_url: String = ""
    override init() {}
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
