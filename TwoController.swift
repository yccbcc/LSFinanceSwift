//
//  TwoController.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/12.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

protocol twoVCProtocol {
    func showNum(num: String) -> ();
}

class TwoController: UIViewController {
    
    var backBlock:((String) -> ())?
    var delegate:twoVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backBlock?("bcd")
        delegate?.showNum(num:"123")
    }
    
    func back2(isUserFirst:Bool, back1:(String)->(),back2:(String)->()) -> () {
        if isUserFirst {
            back1("first")
        }else{
            back2("second")
        }
    }
}
