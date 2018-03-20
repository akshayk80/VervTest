//
//  SelectedGoodsViewModel.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit

/**
 ViewModel for Selected Goods Items.
 */
class SelectedGoodsItemViewModel : NSObject
{
    /** Custom object to hold information for item selected. */
    private var goodItems = [GoodItem]()
    
    /** Custom rate selected by user (GBP if nil). */
    private var rateItem : RateItem?
    
    convenience init(goodItems: [GoodItem]) {
        self.init()
        self.goodItems = goodItems
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
     Provides the name and quantity selected as String of item for passed in indexPath.
     @param indexPath for the item.
     @returns name and quantity selected as String of the item.
     */
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        return "\(self.goodItems[indexPath.row].name)  x  \(self.goodItems[indexPath.row].quantitySelected) item(s)"
    }
    
    /**
     Provides the price description of item for passed in indexPath.
     @param indexPath for the item.
     @returns price description of the item
     */
    func priceDescriptionForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        let totalPriceInGBP : Double = self.goodItems[indexPath.row].price.doubleValue * Double(self.goodItems[indexPath.row].quantitySelected)
        return "Total price: \(totalPriceInGBP) \(kGBPCurrencyItem.currencyName)"
    }
    
    /**
     Provides the price description in selected currency of item for passed in indexPath.
     @param indexPath for the item.
     @returns price description in selected currency of the item
     */
    func priceDescriptionForSelectedCurrencyForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        var desc : String = ""
        
        if let rateItem = rateItem
        {
            let totalPriceInGBP : Double = self.goodItems[indexPath.row].price.doubleValue * Double(self.goodItems[indexPath.row].quantitySelected)
            let totalPriceInSelectedCurrency : Double = totalPriceInGBP * rateItem.rateValue
            desc = "\(String(format: "%.2f", totalPriceInSelectedCurrency)) \(rateItem.code)"
        }
        
        return desc
    }
    
    /**
     Provides the UIImage of item for passed in indexPath.
     @param indexPath for the item.
     @returns UIImage of the item
     */
    func imageForItemAtIndexPath(indexPath: IndexPath) -> UIImage
    {
        return UIImage(named: self.goodItems[indexPath.row].imageName)!
    }
    
    /**
     Updates the rate item selected by the user.
     @param selected rate against GBP for the item.
     */
    func updateCurrency(rateItem: RateItem)
    {
        self.rateItem = rateItem
    }
}

