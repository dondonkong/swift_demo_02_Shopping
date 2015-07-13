//
//  ItemViewController.swift
//  Shopping
//
//  Created by Donte on 15/7/8.
//  Copyright (c) 2015年 Donte. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    
    //var itemName : String?
    //var brandName : String?
    var item : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //if itemName != nil {
        //    itemNameLabel.text = itemName
        //}
        //if brandName != nil {
        //    brandNameLabel.text = brandName
        //}
        if item != nil {
            itemNameLabel.text = item?.itemName
            brandNameLabel.text = item?.brandName
        }
    }
    
    @IBAction func isBuy(sender: UIButton) {
        if item != nil {
            if item?.isBuy == false {
                item?.isBuy = true
                itemNameLabel.textColor = UIColor.greenColor()
            } else {
                item?.isBuy = false
                itemNameLabel.textColor = UIColor.redColor()
            }
            
            println(item?.description())
        }
    }
    
}
