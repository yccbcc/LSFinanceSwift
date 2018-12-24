//
//  Config.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/11.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

public let base_url = "https://www.baidu.com"

//长度定义
public let Screen_Height = UIScreen.main.bounds.height;
public let Screen_Width = UIScreen.main.bounds.width;

public let kLifeWidth:((Float)->Float) = { (x:Float) -> Float in
    return (((x) / 750.0) * Float(Screen_Width))
}
//尺寸定义
public func sgm_safeAreaInset(view:UIView) -> UIEdgeInsets{
    if #available(iOS 11.0, *) {
        return view.safeAreaInsets;
    } else {
        // Fallback on earlier versions
        return UIEdgeInsets.zero;
    };
}

//定时器与延时执行
//原文：https://blog.csdn.net/zxw_xzr/article/details/78317936
public func DispatchTimer(timeInterval: Double, handler:@escaping (DispatchSourceTimer?)->())
{
    let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    timer.schedule(deadline: .now(), repeating: timeInterval)
    timer.setEventHandler {
        DispatchQueue.main.async {
            handler(timer)
        }
    }
    timer.resume()
}

public func DispatchAfter(after: Double, handler:@escaping ()->())
{
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
        handler()
    }
}


