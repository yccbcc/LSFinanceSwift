//
//  BaseTabbarController.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/13.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {
    
    var indexC:IndexController? = nil;
    var productC:ProductController? = nil;
    var myC:MyController? = nil;

    override func viewDidLoad() {
        super.viewDidLoad()

        indexC = IndexController.init();
        self.getNavC(vc: indexC, title: "首页", image: "index_normal_tabbar", selImage: "index_selected_tabbar")
        productC = ProductController.init()
        self.getNavC(vc: productC, title: "产品", image: "classify_normal_tabbar", selImage: "classify_selected_tabbar")
        myC = MyController.init()
        self.getNavC(vc: myC, title: "我的", image: "my_normal_tabbar", selImage: "my_selected_tabbar")
    }
    
    func getNavC(vc:UIViewController?,title:String,image:String,selImage:String) {
        let navC = BaseNavController.init(rootViewController: vc!)
        vc!.title = title
        if #available(iOS 10.0, *) {
            let attributes =  [NSAttributedString.Key.foregroundColor: UIColor(red: 220.0/255.0, green: 104.0/255.0, blue: 1.0/255.0, alpha: 1.0)]
            vc!.tabBarItem.setTitleTextAttributes(attributes, for: .selected)
        } else {
            // Fallback on earlier versions
        }
        
        vc!.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc!.tabBarItem.selectedImage = UIImage.init(named: selImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.addChild(navC)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
