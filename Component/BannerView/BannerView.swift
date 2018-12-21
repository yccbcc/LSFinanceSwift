//
//  BannerView.swift
//  UILbrary
//
//  Created by 斌 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class BannerView: UIView,UIScrollViewDelegate{
    
    init(frame: CGRect, imageArr: [String]?, defaultImg:UIImage?, isMove:Int) {
        super.init(frame: frame)
        let sv = UIScrollView.init(frame: frame);
        sv.showsVerticalScrollIndicator = false;
        sv.showsHorizontalScrollIndicator = false;
        sv.isPagingEnabled = true;
        sv.delegate = self;
        let width = CGFloat(frame.size.width)
        let height = CGFloat(frame.size.height)
        
        if var newImageArr = imageArr {
            var count = newImageArr.count;
            if count > 0 {
                let firstEle = [newImageArr[newImageArr.count - 1]]
                newImageArr.append(newImageArr[0]);
                newImageArr = firstEle + newImageArr;
                count = count + 2;
                sv.contentSize = CGSize.init(width: width * CGFloat(count), height: height);
                for i in 0..<count{
                    let imgV = UIImageView.init(frame: CGRect.init(x: CGFloat(i) * width, y: 0, width: width, height: height))
                    let url = URL(string: newImageArr[i])
                    imgV.kf.setImage(with: url)
                    sv.addSubview(imgV)
                }
                sv.contentOffset = CGPoint.init(x: width, y: 0)
                
                if isMove > 0 {
                    // 在global线程里创建一个时间源
                    let timer = DispatchSource.makeTimerSource(flags: [],queue: DispatchQueue.global())
                    // 设定这个时间源是每秒循环一次，立即开始
                    timer.schedule(deadline: .now(), repeating: .seconds(isMove))
                    // 设定时间源的触发事件
                    timer.setEventHandler(handler: {
                        // 返回主线程处理一些事件，更新UI等等
                        DispatchQueue.main.async {
                            var x = sv.contentOffset.x;
                            x = x + width;
                            sv.setContentOffset(CGPoint.init(x: x, y: 0), animated: true);
                        }
                        if false {
                            timer.cancel()
                        }
                    })
                    // 启动时间源
                    timer.resume()
                }
            }
        }
        
        self.addSubview(sv)
    }
    
    //手拖动时 触发
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("开始减速:\(scrollView.contentOffset)")
        handleSvOffset(scrollView: scrollView)
    }
    //设置offset时触发
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("结束动画:\(scrollView.contentOffset)")
        handleSvOffset(scrollView: scrollView)
    }
    func handleSvOffset(scrollView:UIScrollView)  {
        var x = scrollView.contentOffset.x
        if x <= 0{
            x = scrollView.contentSize.width - scrollView.ld_width * 2
        }else if x >= scrollView.contentSize.width - scrollView.ld_width {
            x = scrollView.ld_width
        }
        scrollView.setContentOffset(CGPoint.init(x: x, y: 0), animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
