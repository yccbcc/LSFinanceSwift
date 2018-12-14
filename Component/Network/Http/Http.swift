//
//  Http.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/11.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import Foundation
import Alamofire


class http: NSObject {
    public class func requestGet(
        url:String,
        paramters:[String:Any]? = nil,
        success:@escaping ([String:Any]?)->(),
        fail:@escaping ([String:Any]?)->()
        )
        -> (){
            //encoding: JSON报文格式的:JSONEcoding.default 和 URLEncoding.default
            Alamofire.request(url, method: HTTPMethod.get, parameters: paramters, headers: nil).responseJSON { (response) in
                if response.result.isSuccess {
                    if let dic:Dictionary<String,Any> = (response.result.value as! Dictionary){
                        success(dic)
                    }else{
                        success([:])
                    }
                }else{
                    print("请求失败")
                }
            }
    }
}
