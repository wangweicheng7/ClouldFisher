//
//  ZLSwiftRefreshExtension.swift
//  ZLSwiftRefresh
//
//  Created by 张磊 on 15-3-6.
//  Copyright (c) 2015年 com.zixue101.www. All rights reserved.
//

import UIKit

let ZLSwithRefreshFootViewHeight:CGFloat = 140
let ZLSwithRefreshHeadViewHeight:CGFloat = 0

enum RefreshStatus{
    case normal, refresh, loadMore
}

let contentOffsetKeyPath = "contentOffset"
var addObserverNum:NSInteger = 0;
var headerView:ZLSwiftHeadView = ZLSwiftHeadView(frame: CGRect.zero)
var footView:ZLSwiftFootView = ZLSwiftFootView(frame: CGRect.zero)

/** refresh && loadMore callBack */
var refreshAction: (() -> ()) = {}
var loadMoreAction: (() -> ()) = {}
var refreshTempAction:(() -> ()) = {}
var loadMoreTempAction:(() -> ()) = {}
var refreshStatus:RefreshStatus = .normal
let animations:CGFloat = 60.0

extension UIScrollView: UIScrollViewDelegate {
    
    //MARK: Refresh
    func toRefreshAction(_ action :@escaping (() -> ())){
        self.addObserver()
        self.addHeadView()
        refreshAction = action
    }
    
    //MARK: LoadMore
    func toLoadMoreAction(_ action :@escaping (() -> ())){
        self.addObserver()
        self.addFootView()
        loadMoreAction = action
    }
    
    //MARK: AddHeadView && FootView
    func addHeadView(){
        let headView:ZLSwiftHeadView = ZLSwiftHeadView(frame: CGRect(x: 0, y: -ZLSwithRefreshHeadViewHeight, width: self.frame.size.width, height: ZLSwithRefreshHeadViewHeight))
        self.addSubview(headView)
        headerView = headView
    }
    
    func addFootView(){
        footView = ZLSwiftFootView(frame: CGRect(x: 0, y: -ZLSwithRefreshFootViewHeight, width: self.frame.size.width, height: ZLSwithRefreshHeadViewHeight))
        let tempTableView :UITableView = self as! UITableView
        footView.backgroundColor = UIColor.lightGray
        tempTableView.tableFooterView = footView
    }
    
    //MARK: Observer KVO Method
    func addObserver(){
        
        if(addObserverNum == 0){
            self.addObserver(self, forKeyPath: contentOffsetKeyPath, options: .initial, context: nil)
        }
        
        addObserverNum+=1
    }
    
    func removeObserver(){
        self.removeObserver(self, forKeyPath: contentOffsetKeyPath)
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        let scrollView = self
        let tempTableView :UITableView = self as! UITableView
        let scrollViewContentOffsetY:CGFloat = scrollView.contentOffset.y

        
        // 下拉刷新
        if (scrollViewContentOffsetY <= -ZLSwithRefreshHeadViewHeight) {
            // 提示 -》松开刷新
            if scrollView.isDragging == false && headerView.headImageView.isAnimating == false{
                refreshStatus = .refresh
                headerView.startAnimation()
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    scrollView.contentInset = UIEdgeInsetsMake(ZLSwithRefreshHeadViewHeight, 0, scrollView.contentInset.bottom, 0)
                })
                refreshTempAction()
                refreshTempAction = {}
            }
            
        }else{
            
            refreshTempAction = refreshAction
            
            var v:CGFloat = scrollViewContentOffsetY
            if (v < -animations){
                v = animations
            }
            
            headerView.imgName = "\((Int)(abs(v)))"
        }
        
        if tempTableView.tableFooterView != nil && scrollViewContentOffsetY > 0{
            // 上啦加载更多
            
            let nowContentOffsetY:CGFloat = scrollView.contentOffset.y + self.frame.size.height
            let tableViewMaxHeight:CGFloat = tempTableView.tableFooterView!.frame.midY
            
            
            footView.gearRefreshView.animate(with: scrollView.contentOffset.y )
            
            if (nowContentOffsetY - tableViewMaxHeight) > ZLSwithRefreshFootViewHeight * 0.5{
                if scrollView.isDragging == false {
                    
                    refreshStatus = .loadMore
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top, 0, ZLSwithRefreshFootViewHeight, 0)
                    })
                    footView.gearRefreshView.isRefreshing = true
                    loadMoreTempAction()
                    loadMoreTempAction = {}
                }
            }else{
                loadMoreTempAction = loadMoreAction
                footView.gearRefreshView.isRefreshing = false
            }
        }
    }
    
    func stopAnimation(){
        if headerView.headImageView.isAnimating {
            headerView.stopAnimation()
        }
        
        if refreshStatus == .loadMore {
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.contentInset = UIEdgeInsetsMake(self.contentInset.top, 0, 0, 0)
            })
            footView.gearRefreshView.isRefreshing = false
            footView.gearRefreshView.isRefreshControlAnimating = false
        }else if refreshStatus == .refresh {
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.contentInset = UIEdgeInsetsMake(0, 0, self.contentInset.bottom, 0)
            })
        }
    }

}

