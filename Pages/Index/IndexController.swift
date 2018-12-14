//
//  IndexController.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/13.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

class IndexController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestHeaderData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func requestHeaderData()  {
        let param:[String:Any] = ["appKey":"40568a81ec2acd6284b2f94b4a114396e1825e98","clientType":"1","token":"946f59c1755872b4fec204a9ec8ba4e7c77958cc885dbc141f3005b1533137aa99b4b00bbfe0a32f8b4a1c3a573f6b77e9a8d63dab18e79a605fbeb8092714e2"]
        http.requestGet(url: "https://jr.letvjr.com/apiadapter/home/homePage/v12/40568a81ec2acd6284b2f94b4a114396e1825e98", paramters: param, success: { (data) in
            
        }) { (error) in
            
        }
    }
    

}
