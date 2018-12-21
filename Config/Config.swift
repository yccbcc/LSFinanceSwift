//
//  Config.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/11.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

public let base_url = "https://www.baidu.com"


public let Screen_Height = UIScreen.main.bounds.height;
public let Screen_Width = UIScreen.main.bounds.width;

public let kLifeWidth:((Float)->Float) = { (x:Float) -> Float in
    return (((x) / 750.0) * Float(Screen_Width))
}

public func sgm_safeAreaInset(view:UIView) -> UIEdgeInsets{
    if #available(iOS 11.0, *) {
        return view.safeAreaInsets;
    } else {
        // Fallback on earlier versions
        return UIEdgeInsets.zero;
    };
}

