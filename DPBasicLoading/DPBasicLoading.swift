//
//  DPBasicLoading.swift
//  BasicLoading
//
//  Created by Dwi Putra on 1/17/16.
//  Copyright © 2016 dwipp. All rights reserved.
//

import UIKit

class DPBasicLoading: UIView {
    private let centerView: UIView = UIView()
    private let label = UILabel()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    convenience init(table:UITableView){
        self.init(frame: table.frame)
        label.font = UIFont.systemFontOfSize(14)
        table.backgroundView=self
        table.tableFooterView = UIView()
    }
    
    convenience init(table:UITableView, fontName:String){
        self.init(frame: table.frame)
        label.font = UIFont(name: fontName, size: 14)
        table.backgroundView=self
        table.tableFooterView = UIView()
    }
    
    
    convenience init(collection:UICollectionView) {
        self.init(frame: collection.frame)
        label.font = UIFont.systemFontOfSize(14)
        collection.backgroundView=self
    }
    
    convenience init(collection:UICollectionView, fontName:String) {
        self.init(frame: collection.frame)
        label.font = UIFont(name: fontName, size: 14)
        collection.backgroundView=self
    }
    
    private func setupView(){
        backgroundColor = UIColor.clearColor()
        centerView.backgroundColor = UIColor.clearColor()
        centerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centerView)
        
        let views = ["centerView": centerView, "superview": self]
        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[superview]-(<=1)-[centerView]",
            options: .AlignAllCenterX,
            metrics: nil,
            views: views)
        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:[superview]-(<=1)-[centerView]",
            options: .AlignAllCenterY,
            metrics: nil,
            views: views)
        self.addConstraints(vConstraints)
        self.addConstraints(hConstraints)
    }
    
    private func setupLoading(text:String){
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.grayColor()
        centerView.addSubview(label)
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(activityIndicator)
        
        let viewLoading = ["label": label, "activity": activityIndicator]
        let hConstraintsLoading = NSLayoutConstraint.constraintsWithVisualFormat("|-[activity]-[label]-|", options: [], metrics: nil, views: viewLoading)
        let vConstraintsLabel = NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: [], metrics: nil, views: viewLoading)
        let vConstraintsActivity = NSLayoutConstraint.constraintsWithVisualFormat("V:|[activity]|", options: [], metrics: nil, views: viewLoading)
        
        centerView.addConstraints(hConstraintsLoading)
        centerView.addConstraints(vConstraintsLabel)
        centerView.addConstraints(vConstraintsActivity)
    }
    
    
    func startLoading(text:String){
        setupView()
        setupLoading(text)
    }
    
    
    func endLoading(){
        centerView.removeFromSuperview()
        self.removeFromSuperview()
    }
}
