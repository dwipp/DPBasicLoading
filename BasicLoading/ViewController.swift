//
//  ViewController.swift
//  BasicLoading
//
//  Created by Dwi Putra on 1/17/16.
//  Copyright © 2016 dwipp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table_view: UITableView!
    
    var data_array:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reload = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "loadData")
        self.navigationItem.rightBarButtonItem = reload
        
        self.loadData()
    }
    
    func loadData(){
        self.data_array = []
        self.table_view.reloadData()
        let loading = DPBasicLoading(table: table_view, fontName: "HelveticaNeue")
        loading.startLoading("Loading...")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.data_array = ["iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus"]
            self.table_view.reloadData()
            loading.endLoading()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController:UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = data_array[indexPath.row]
        return cell
    }


}

