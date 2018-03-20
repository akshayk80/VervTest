//
//  GoodItem.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import UIKit

/**
 Model to represent a Goods Item.
 */
struct GoodItem
{
    /** name of the item. */
    var name : String
    
    /** price of the item. */
    var price : NSNumber
    
    /** price description of the item e.g. with per 100g. */
    var priceDescription : String
    
    /** image name of the item. */
    var imageName : String
    
    /** quantity selected by user. */
    var quantitySelected : Int
    
    /** initialise item with dictionary from Goods.plist. */
    init(dict : Dictionary<String, Any>)
    {
        name = dict["name"] as! String
        price = dict["price"] as! NSNumber
        priceDescription = dict["priceDescription"] as! String
        imageName = dict["imageName"] as! String
        quantitySelected = 0
    }
}

