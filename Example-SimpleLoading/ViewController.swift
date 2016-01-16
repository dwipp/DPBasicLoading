//
//  ViewController.swift
//  Example-SimpleLoading
//
//  Created by Dwi Putra on 1/15/16.
//  Copyright © 2016 dwipp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table_view: UITableView!
    
    let data_array = ["Center", "TopRight", "TopLeft", "BottomRight", "BottomLeft"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "to_list" {
            if let list = segue.destinationViewController as? ListViewController {
                list.selectedLoading = sender as? String
            }
        }
    }
    
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = data_array[indexPath.row]
        if indexPath.row > 0 {
            cell.userInteractionEnabled = false
            cell.textLabel?.textColor = UIColor.grayColor()
        }
        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("to_list", sender: data_array[indexPath.row])
    }
}



