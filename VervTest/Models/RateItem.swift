//
//  RateItem.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation

/**
 Model to represent a converted Rate Item for a given currency.
 */
struct RateItem
{
    /** code of the converted currency. */
    var code : String
    
    /** value of the converted currency. */
    var rateValue : Double
}

