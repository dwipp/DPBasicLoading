//
//  ListViewController.swift
//  Example-SimpleLoading
//
//  Created by Dwi Putra on 1/15/16.
//  Copyright © 2016 dwipp. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var table_view: UITableView!
    var data_array:[String] = []
    var selectedLoading:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedLoading!
        
        
        let loading = DPSimpleLoading(table: table_view)
        loading.startLoading("Loading...")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.data_array = ["One", "Two", "Three", "Four"]
            self.table_view.reloadData()
            
            loading.endLoading()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "to_detail" {
            if let list = segue.destinationViewController as? DetailViewController {
                list.selectedItem = sender as? String
            }
        }
    }

}

extension ListViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel?.text = data_array[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("to_detail", sender: data_array[indexPath.row])
    }
}
