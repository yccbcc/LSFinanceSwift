//
//  IndexController.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/13.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

class IndexController: BaseController,UITableViewDelegate,UITableViewDataSource,BannerViewDelegate {

    var tv:UITableView? = nil;
    var networkLoading:NetworkLoading?
    var bodyModel:IndexBodyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        requestHeaderData()
        requestBodyData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    //网络请求
    func requestBodyData()  {
        networkLoading = NetworkLoading.init().showLoading(networkLoadType: .loadAndResultView, bgView: self.view);
        networkLoading?.backBlock = {
            self.requestBodyData()
        }
        let param:[String:Any] = ["appKey":"356a192b7913b04c54574d18c28d46e6395428ab","clientType":1]
        let url:String = "http://p2p-test.letvjr.com:8080/api/p2p/contentMang/getRecommendedList"
        http.requestGet(url: url, paramters: param, success: { (data) in
            self.networkLoading?.hideLoading(networkLoadType: .loadAndResultView, bgView: self.view, isSuccess: true)

            if let data2 = data{
                let data3 = data2  as! Dictionary<String,Any>
                self.bodyModel = IndexBodyModel.deserialize(from: data3)
                self.tv?.reloadData()
            }
        }) { (error) in
            self.networkLoading?.hideLoading(networkLoadType: .loadAndResultView, bgView: self.view, isSuccess: false)
        }
    }
    
    func requestHeaderData()  {
        let param:[String:Any] = ["appKey":"40568a81ec2acd6284b2f94b4a114396e1825e98","clientType":"1","token":"946f59c1755872b4fec204a9ec8ba4e7c77958cc885dbc141f3005b1533137aa99b4b00bbfe0a32f8b4a1c3a573f6b77e9a8d63dab18e79a605fbeb8092714e2"]
        http.requestGet(url: "https://jr.letvjr.com/apiadapter/home/homePage/v12/40568a81ec2acd6284b2f94b4a114396e1825e98", paramters: param, success: { (data) in
            
            if let data2 = data {
                let data3 = data2 as! Dictionary<String,Any>
                let indexModel = IndexCModel.deserialize(from: data3)
                print(indexModel!)
                if let adInfo = indexModel?.adInfo{
                    self.createBannerView(imageList: adInfo)
                }
            }
        }) { (error) in
        }
    }
    
//    UI相关
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let insets = sgm_safeAreaInset(view: self.view)
        tv!.frame = CGRect.init(x: 0, y: 0, width: Screen_Width, height: self.view.ld_height - insets.bottom);
    }
    
    
    func createUI() -> () {
        print(self.view.ld_height)
        tv = UITableView.init(frame: CGRect.init(), style: UITableView.Style.plain);
        tv?.delegate = self;
        tv?.dataSource = self;
        self.view.addSubview(tv!);
        tv?.register(UINib.init(nibName: "IndexCell", bundle: nil), forCellReuseIdentifier: "IndexCellId")
        
        if #available(iOS 11.0, *) {
            tv?.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false;
        };
        
    }
    
    func createBannerView(imageList:Array<Any>) -> () {
        var imageUrls:[String] = []
        var titleArray:[String] = []
        for item in imageList {
            let item2 = item as! adInfoItem
            if let url = item2.pic {
                imageUrls.append(url)
            }
            if let title = item2.title{
                titleArray.append(title)
            }
        }
        print(imageUrls)
        let image = UIImage.init(named: "xin.png")
        imageUrls.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545395433900&di=567fdc599080c08af5b8ec20c25f96bd&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farchive%2Fe18ecef7e7bede5ee9c910d084ad43f49bbb1b71.png")
        let banner = BannerView.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: 250), imageArr: imageUrls, defaultImg: image, isMove: 5)
        banner.tapDelegate = self;
        tv!.tableHeaderView = banner;
    }
    
    func bannerTapIndex(_ index: Int) {
        print(index)
    }
    
    //tv-edelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        if bodyModel != nil && bodyModel!.dataList != nil {
            return bodyModel!.dataList!.count;
        }else{
            return 0;
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionItem = bodyModel?.dataList?[section]
        let cellArr = sectionItem?.productVoList
        return (cellArr?.count)!;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndexCellId")
        let sectionItem = bodyModel?.dataList?[indexPath.section]
        let cellArr = sectionItem?.productVoList
        let cellItem = cellArr?[indexPath.row]
        let indexCell = cell! as! IndexCell
        indexCell.nameLb.text = cellItem?.projectName;
        indexCell.rateYearLb.text = "利率:\(cellItem!.rateYear!)%";
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionItem = bodyModel?.dataList?[section]
        let lb = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: 50));
        lb.text = sectionItem?.recommendName
        lb.font = UIFont.systemFont(ofSize: 20);
        lb.textColor = UIColor.red;
        lb.textAlignment = .center;
        
        return lb;
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60;
    }
}
