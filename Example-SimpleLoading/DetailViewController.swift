//
//  DetailViewController.swift
//  Example-SimpleLoading
//
//  Created by Dwi Putra on 1/15/16.
//  Copyright © 2016 dwipp. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lbl_status: UILabel!

    var selectedItem:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_status.text = selectedItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
