//
//  RecommendViewModel.swift
//  live-streaming-demo
//
//  Created by Zijia Zhai on 1/16/19.
//  Copyright © 2019 zijia. All rights reserved.
//

import UIKit

class RecommendViewModel: BaseViewModel{
    lazy var cycleModels : [CycleModel] = [CycleModel]()
}



extension RecommendViewModel{
    
    
    // 请求无线轮播的数据
    func requestCycleData(_ finishCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            ZJPrint(result)
            // 1.获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                ZJPrint(dict)
                self.cycleModels.append(CycleModel(dict: dict))
                if let first = self.cycleModels.first{
                    ZJPrint(first)
                    ZJPrint(first.pic_url)
                    ZJPrint(first.title)
                }
            }
//            if let test = self.cycleModels.first{
//                ZJPrint(test.pic_url)
//            }
            
            finishCallback()
        }
    }
}
