//
//  GoodsItemViewModel.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import UIKit

/**
 ViewModel for Goods Items created from Goods.plist data.
 */
class GoodsItemViewModel : NSObject
{
    /** Custom object to hold information for each goods item fetched from plist. */
    private var goodItems = [GoodItem]()
    
    /**
     Setup goods from Goods.plist to initialise the ViewModel.
     */
    func setupGoods() 
    {
        // initialise goods from data in Goods.plist file
        let pathForGoodaData = Bundle.main.path(forResource: "Goods", ofType: "plist")!
        let goodsDict = NSArray(contentsOfFile: pathForGoodaData)
        
        goodsDict?.forEach {
            let item = $0 as! Dictionary<String, Any>
            goodItems.append(GoodItem(dict: item))
        }
    }
    
    /**
     Check if view model has items.
     @returns true if has items else returns false.
     */
    func hasItems() -> Bool
    {
        return (self.goodItems.count > 0)
    }
    
    /**
     Provides the number of items in a table view section. As there is only one section, this equals to overall number of items which can be displayed.
     @param section for which number of items to return.
     @returns Number of items.
     */
    func numberOfItemsInSection(section: Int) -> Int
    {
        return self.goodItems.count
    }
    
    /**
     Provides the name of item for passed in indexPath.
     @param indexPath for the item.
     @returns name of the item.
     */
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        return self.goodItems[indexPath.row].name
    }
    
    /**
     Provides the price description for passed in indexPath.
     @param indexPath for the item.
     @returns price description of the item
     */
    func priceDescriptionForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        return self.goodItems[indexPath.row].priceDescription
    }
    
    /**
     Provides the actual price for passed in indexPath.
     @param indexPath for the item.
     @returns price of the item
     */
    func priceForItemAtIndexPath(indexPath: IndexPath) -> NSNumber
    {
        return self.goodItems[indexPath.row].price
    }
    
    /**
     Provides the image for passed in indexPath.
     @param indexPath for the item.
     @returns UIImage of the item
     */
    func imageForItemAtIndexPath(indexPath: IndexPath) -> UIImage
    {
        return UIImage(named: self.goodItems[indexPath.row].imageName)!
    }
    
    /**
     Provides the quantity selected by user for passed in indexPath.
     @param indexPath for the item.
     @returns quantity of the item
     */
    func quantityForItemAt(indexPath: IndexPath) -> Int
    {
        return self.goodItems[indexPath.row].quantitySelected
    }
    
    /**
     Updates the quantity of the item for passed in indexPath.
     @param indexPath for the item.
     */
    func updateQuantityForItemAt(indexPath: IndexPath, quantity: Int)
    {
        self.goodItems[indexPath.row].quantitySelected = quantity
    }
    
    /**
     Returns the goods that are selected by the user (i.e. quantity of an item is atleast 1 or above).
     @returns selected goods
     */
    func selectedGoodsItems() -> [GoodItem]
    {
        return self.goodItems.filter { $0.quantitySelected > 0 }
    }
}

