//
//  ViewController.swift
//  Shopping
//
//  Created by Donte on 15/7/8.
//  Copyright (c) 2015年 Donte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewItemViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //let toBuyItems =    [("milk","sanyuan"),("noodle","kangshifu"),("peach juice","huiyuan"),("chocalate","dove"),("water","dilu"),("shampoo","piaorou")]
    var toBuyItems = [Item(itemName: "milk", brandName: "sanyuan"), Item(itemName: "noodle", brandName: "kangshifu"), Item(itemName: "peach juice", brandName: "huiyuan"), Item(itemName: "chocalate", brandName: "dove"), Item(itemName: "water", brandName: "dilu"), Item(itemName: "shampoo", brandName: "piaorou")]
    //var toBuyItems : Items = Items(items: [Item(itemName: "milk", brandName: "sanyuan"), Item(itemName: "noodle", brandName: "kangshifu"), Item(itemName: "peach juice", brandName: "huiyuan"), Item(itemName: "chocalate", brandName: "dove"), Item(itemName: "water", brandName: "dilu"), Item(itemName: "shampoo", brandName: "piaorou")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toBuyItems.count
        //return toBuyItems.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        
        //let (item, brand) = toBuyItems[indexPath.row]
        //cell.textLabel?.text = item
        //cell.detailTextLabel?.text = brand
        
        let item = toBuyItems[indexPath.row]
        //let item = toBuyItems.items[indexPath.row]
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = item.brandName
        if item.isBuy {
            cell.textLabel?.textColor = UIColor.greenColor()
        } else {
            cell.textLabel?.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("itemSegue", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "itemSegue" {
            var destination: ItemViewController = segue.destinationViewController as! ItemViewController
            
            if sender is Int {
                //var (itemName, brandName) = toBuyItems[sender as! Int]
                //destination.itemName = itemName
                //destination.brandName = brandName
                
                var item = toBuyItems[sender as! Int]
                //var item = toBuyItems.items[sender as! Int]
                destination.item = item
            }
        }
        
        if segue.identifier == "newItemSegue" {
            var destination: NewItemViewController = segue.destinationViewController as! NewItemViewController
            //destination.items = self.toBuyItems
            destination.delegate = self
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func addNewItem(controller: NewItemViewController, item: Item) {
        toBuyItems.append(item)
        tableView.reloadData()
        
        //controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

