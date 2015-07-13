//
//  NewItemViewController.swift
//  Shopping
//
//  Created by Donte on 15/7/8.
//  Copyright (c) 2015年 Donte. All rights reserved.
//

import UIKit

protocol NewItemViewControllerDelegate {
    func addNewItem(controller: NewItemViewController, item: Item)
}

class NewItemViewController: UIViewController {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var brandNameTextField: UITextField!
    
    var item : Item?
    //var items : Items?
    var delegate : NewItemViewControllerDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveItem(sender: UIButton) {
        //println("items.count: \(items?.items.count)")
        
        if itemNameTextField.text != nil && brandNameTextField.text != nil {
            item = Item(itemName: itemNameTextField.text, brandName: brandNameTextField.text)
            //items?.items.append(item)
            delegate.addNewItem(self, item: item!)
        }
        
        println(item!.description())
        //println("items.count: \(items?.items.count)")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
