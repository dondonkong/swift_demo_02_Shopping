//
//  Item.swift
//  Shopping
//
//  Created by Donte on 15/7/12.
//  Copyright (c) 2015年 Donte. All rights reserved.
//

import Foundation

class Item {
    
    var itemName : String = ""
    var brandName : String = ""
    var isBuy : Bool = false
    
    init (itemName : String, brandName : String, isBuy : Bool) {
        self.itemName = itemName
        self.brandName = brandName
        self.isBuy = isBuy
    }
    
    convenience init (itemName : String) {
        self.init(itemName : itemName, brandName : "", isBuy : false)
    }
    
    convenience init (itemName : String, brandName : String) {
        self.init(itemName : itemName, brandName : brandName, isBuy : false)
    }
    
    func description() -> String {
        return "itenName: \(itemName), brandName: \(brandName), isBuy: \(isBuy)"
    }
    
}

class Items {
    
    var items: [Item?] = []
    
    init (items : [Item]) {
        for var i=0; i<items.count; i++ {
            self.items.append(items[i])
        }
    }
}

