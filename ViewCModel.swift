//
//  ViewCModel.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/12.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import Foundation
import HandyJSON

class ViewCModel: HandyJSON {
    var url: String?
    var origin: String?
    var headers: Headers = Headers()
    required init(){}
}


struct Headers: HandyJSON {
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
