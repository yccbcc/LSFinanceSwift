//
//  NetworkLoading.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/13.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit
import Foundation

public enum NetworkLoadType {
    case loadAndResultView
    case loadingAndTxt
    case txt
}

class NetworkLoading {
    
    
    func showActivityIndicator(bgView:UIView){
        MBProgressHUD.hide(for: bgView, animated: false)
        let hud = MBProgressHUD.showAdded(to: bgView, animated: true)
        hud.minShowTime = 1.0
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor
        hud.bezelView.color = UIColor.black
        hud.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
        hud.backgroundView.color = UIColor.black
        hud.backgroundView.alpha = 0.2
        hud.contentColor = UIColor.white
        hud.removeFromSuperViewOnHide = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideActivityIndicator(bgView:UIView){
        MBProgressHUD.hide(for: bgView, animated: true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func showHudMsg(msg:String){
        let window = UIApplication.shared.keyWindow!
        MBProgressHUD.hide(for: window, animated: false)
        let hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud.label.text = msg;
        hud.animationType = MBProgressHUDAnimation.zoom;
        hud.mode = MBProgressHUDMode.text;
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor;
        hud.bezelView.color = UIColor.black
        hud.label.textColor = UIColor.white
        hud.backgroundView.color = UIColor.white
        hud.removeFromSuperViewOnHide = true;
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    var backBlock:(()->())? = nil;
    
    func showResultView(superView:UIView){
        let resultView = UIView.viewWithTag(superView)(100)
        resultView?.removeFromSuperview()
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: Screen_Height));
        view.tag = 100;
        view.isUserInteractionEnabled = true;
        view.backgroundColor = UIColor.white;
        superView.addSubview(view);
        
        let imgV = UIImageView.init(frame: CGRect.init(x: (Screen_Width - 200) / 2, y: 200, width: 200, height: 200))
        imgV.image = UIImage.init(named: "xin.png")
        view.addSubview(imgV)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.imgTap(tap:)))
        tap.numberOfTapsRequired = 1;
        imgV.isUserInteractionEnabled = true;
        imgV.addGestureRecognizer(tap)
                
        let lb = UILabel.init(frame: CGRect.init(x: imgV.ld_x, y: imgV.ld_y + imgV.ld_height + 20, width: imgV.ld_width, height: 30))
        lb.text = "请求失败,请重新尝试"
        lb.textAlignment = .center;
        view.addSubview(lb);
    }
    
    @objc func imgTap(tap:UITapGestureRecognizer){
        self.backBlock?()
    }
    
    func hideResultView(superView:UIView){
        let resultView = UIView.viewWithTag(superView)(100)
        resultView?.removeFromSuperview()
    }
    
    public func showLoading(networkLoadType:NetworkLoadType,bgView:UIView?) -> (NetworkLoading){
        if networkLoadType == .loadAndResultView {
            showActivityIndicator(bgView: bgView!)
        }else if networkLoadType == .loadingAndTxt{
            showActivityIndicator(bgView: bgView!)
        }else{
            
        }
        return self;
    }
    public func hideLoading(networkLoadType:NetworkLoadType,bgView:UIView?,isSuccess:Bool){
        if networkLoadType == .loadAndResultView {
            if isSuccess {
                hideActivityIndicator(bgView: bgView!)
                hideResultView(superView: bgView!)
            }else{
                showResultView(superView: bgView!)
            }
        }else if networkLoadType == .loadingAndTxt{
            hideActivityIndicator(bgView: bgView!)
            if isSuccess == false{
                showHudMsg(msg: "请求失败,请稍后重试")
            }
        }else{
            if isSuccess == false{
                showHudMsg(msg: "请求失败,请稍后重试")
            }
        }
    }
}
