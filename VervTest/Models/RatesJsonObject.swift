//
//  RatesJsonObject.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation

/**
 Model to represent a Rates json object.
 */
class RatesJsonObject : Decodable
{
    /** rates dictionary for the chosen currency (GBP), containing currency code and value. */
    let rates : Dictionary<String, Double>
    
    /** currency code to get converted rates for. */
    let base : String
    
    /** date when the values retrived. */
    let date : String
}

