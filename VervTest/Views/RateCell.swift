//
//  RateCell.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit
/**
 Custom Table View Cell to display Rates.
 */
class RateCell: UITableViewCell
{
    /** Label to display code of the converted currency. */
    @IBOutlet var currencyCodeLabel : UILabel?
    
    /** Label to display value of converted currency. */
    @IBOutlet var rateValueLabel : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
}

