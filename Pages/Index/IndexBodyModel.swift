//
//  IndexBodyModel.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/24.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit
import HandyJSON

class IndexBodyModel: HandyJSON {
    var dataList:[sectionItem]?
    required init(){}
}

class sectionItem: HandyJSON {
    var createTime:String?
    var id:Int?
    var recommendName:String?
    var productVoList:[cellItem]?
    required init(){}
}

class cellItem: HandyJSON {
    var projectCode:Int?
    var lockDays:Int?
    var projectName:String?
    var publishFinishTime:String?
    var rateYear:Int?
    var riskLevel:Int?
    var usableAmount:Int?
    required init(){}
}
