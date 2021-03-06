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
        success:@escaping (Any?)->(),
        fail:@escaping (Any?)->()
        )
        -> (){
            //encoding: JSON报文格式的:JSONEcoding.default 和 URLEncoding.default
            print("请求url:\(url)")
            if let para = paramters{
                print("参数:\(para)")
            }
            Alamofire.request(url, method: HTTPMethod.get, parameters: paramters, headers: nil).responseJSON { (response) in
                if response.result.isSuccess {
                    if let dic:Dictionary<String, Any?> = (response.result.value as? Dictionary){
                        if let code = dic["code"]{
                            if code as! Int == 200 {
                                print("请求成功,url:\(url)")
                                success(dic["data"] as? [String : Any])
                            }else{
                                fail("")
                                print("请求错误url:\(url) msg:\(dic["message"])")
                            }
                        }else{
                            print("返回数据没有返回码.请求错误")
                        }

                    }else{
                        print("返回数据为空")
                    }
                }else{
                    print("请求失败")
                }
            }
    }
}
