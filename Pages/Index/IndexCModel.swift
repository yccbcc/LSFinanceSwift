//
//  IndexCModel.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/18.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import Foundation
import HandyJSON

class IndexCModel: HandyJSON {
    var topInfos: Array<topInfoItem>?
    var adInfo:Array<adInfoItem>?
    required init(){}
}

class adInfoItem: HandyJSON {
    var code: String?
    var httpUrl: String?
    var nativeUrl: String?
    var pic: String?
    var require: String?
    var subTitle: String?
    var title: String?
    required init(){}
}

class topInfoItem: HandyJSON {
    var httpUrl: String?
    var leftHit: String?
    var nativeUrl: String?
    var pic: String?
    var righthit: String?
    var title: String?
    required init(){}
}

struct Headersa: HandyJSON {
    var Accept:String?
    var AcceptEncoding:String?
    var AcceptLanguage:String?
    var Connection:String?
    var ContentType:String?
    var Host:String?
    var UserAgent:String?
    
    mutating func mapping(mapper: HelpingMapper) {
        // 指定 id 字段用 "cat_id" 去解析
        mapper.specify(property: &AcceptEncoding, name: "Accept-Encoding")
        mapper.specify(property: &AcceptLanguage, name: "Accept-Language")
        mapper.specify(property: &ContentType, name: "Content-Type")
        mapper.specify(property: &UserAgent, name: "User-Agent")
        
        // 指定 parent 字段用这个方法去解析
        //        mapper.specify(property: &parent) { (rawString) -> (String, String) in
        //            let parentNames = rawString.characters.split{$0 == "/"}.map(String.init)
        //            return (parentNames[0], parentNames[1])
        //        }
    }
}
