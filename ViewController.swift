//
//  ViewController.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/11.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit


class ViewController: UIViewController,twoVCProtocol {

    
    var networkLoading:NetworkLoading?
    var num:Int = 1;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request();
    }
    
    func request() -> () {
        networkLoading = NetworkLoading.init().showLoading(networkLoadType: .loadAndResultView, bgView: self.view);
        networkLoading?.backBlock = {
            self.request();
        }
        http.requestGet(url: test_url, success: { (data) in
            let b = self.num % 2 == 0
            self.networkLoading?.hideLoading(networkLoadType: .loadAndResultView, bgView: self.view, isSuccess: b)
            self.num += 1
            
            if let newData = data{
                let a = newData as? Dictionary<String,Any>
                let model = ViewCModel.deserialize(from: a);
            }
            
            
            
            
        }) { (error) in
            print(error!)
        }
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
//        var abc:[String:Any] = [:]
//        abc["a"] = "abc"
//
//        var def:[Any] = ["ac",123]
//        print(def)
//
        let vc = TwoController.init()
//        //闭包
//        vc.backBlock = { str in
//            print(str)
//        }
//        //函数中闭包
//        vc.back2(isUserFirst:true,back1: { (str) in
//            print(str)
//        }) { (str2) in
//            print(str2)
//        }
//        //代理
//        vc.delegate = self;
//
//
//        self.present(vc, animated: true) {
//            print("跳转完成")
//        }
        
    }
    //代理实现
    func showNum(num: String) {
        print(num)
    }


}
