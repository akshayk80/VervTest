//
//  RateViewModel.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation

/**
 ViewModel for Rate Items created from JSON data.
 */
class RateViewModel : NSObject
{
    /** Helper class to fetch initial json data. */
    var currencyRatesClient = CurrencyRatesClient()
    
    /** Custom object to hold information for each currencies fetched. */
    private var rateItems = [RateItem]()
    
    /**
     Fetch url items to initialise the ViewModel.
     @param completion to be called once task for fetching data is completed.
     */
    func fetchCurrencyRates(currencyCode: String, completion: @escaping () -> ())
    {
        currencyRatesClient.fetchCurrencyRates(currencyCode: currencyCode) { ratesJsonObject in
            if let rates = ratesJsonObject?.rates
            {
                for rate in rates
                {
                    self.rateItems.append(RateItem(code: rate.key, rateValue: rate.value))
                }
            }
            
            completion()
        }
    }
    
    /**
     Check if view model has items.
     @returns true if has items else returns false.
     */
    func hasItems() -> Bool
    {
        return (self.rateItems.count > 0)
    }
    
    /**
     Provides the number of items in a table view section. As there is only one section, this equals to overall number of items which can be displayed.
     @param section for which number of items to return.
     @returns Number of items.
     */
    func numberOfItemsInSection(section: Int) -> Int
    {
        return self.rateItems.count
    }
    
    /**
     Provides the currency code for passed in indexPath.
     @param indexPath for the item.
     @returns currency code of the item.
     */
    func currencyCodeForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        return self.rateItems[indexPath.row].code
    }
    
    /**
     Provides the converted value of currency for passed in indexPath.
     @param indexPath for the item.
     @returns converted value of the currency
     */
    func rateDescriptionForItemAtIndexPath(indexPath: IndexPath) -> String
    {
        return "\(self.rateItems[indexPath.row].rateValue)"
    }
    
    /**
     Provides the converted value of currency for passed in indexPath.
     @param indexPath for the item.
     @returns converted value of the currency
     */
    func rateItemItemAtIndexPath(indexPath: IndexPath) -> RateItem
    {
        return self.rateItems[indexPath.row]
    }
}
