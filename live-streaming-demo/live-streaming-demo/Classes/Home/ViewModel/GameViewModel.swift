//
//  GameViewModel.swift
//  DYZB
//
//  Created by 1 on 16/10/8.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games: [BaseGameModel] = [BaseGameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback : @escaping () -> Void) {
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName": "game"]) { (result) in
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            for dict in dataArray {
                self.games.append(BaseGameModel(dict: dict))
            }
            finishedCallback()
        }
    }
}
