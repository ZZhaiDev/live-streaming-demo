//
//  Common.swift
//  live-streaming-demo
//
//  Created by zijia on 12/4/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

let zjScreenW = UIScreen.main.bounds.width
let zjScreenH = UIScreen.main.bounds.height

let isIphoneX = zjScreenH >= 812 ? true : false
let zjStatusBarH : CGFloat = isIphoneX ? 44 : 20
let zjNavigationBarH : CGFloat = 44
let zjTabbarH : CGFloat = isIphoneX ? 49 + 34 : 49


func ZJPrint<T>(_ message : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("ZJPrint: \(NSDate())----\(fileName) line:\(lineNumber)- \(message)")
    #endif
}
