//
//  CurrencyRatesClient.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation

/**
 Currency Client to fetch JSON results for the chosen currency.
 */
class CurrencyRatesClient : NSObject
{
    /** Base url for the currency convertor. */
    private let baseUrlString : String = "https://api.fixer.io/latest?base="
    
    /**
     Fetch rates for the passed in currency.
     @param completion to call with json object for rates fethced
     */
    func fetchCurrencyRates(currencyCode: String, completion: @escaping (RatesJsonObject?) -> ())
    {
        let urlString = baseUrlString + currencyCode
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            if error != nil
            {
                completion(nil)
                return
            }
            else
            {
                do
                {
                    let items = try JSONDecoder().decode(RatesJsonObject.self, from: data)
                    completion(items)
                    return
                }
                catch let jsonErr
                {
                    print("Error serializing json:", jsonErr)
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
