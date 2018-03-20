//
//  SelectedGoodCell.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit

/**
 Custom Table View Cell to display data.
 */
class SelectedGoodCell: UITableViewCell
{
    /** Label to display title of the selected item. */
    @IBOutlet weak var titleLabel : UILabel?
    
    /** Label to display price description of the selected item. */
    @IBOutlet weak var priceDescriptionLabel : UILabel?
    
    /** Label to display price description in selected currency of the selected item. */
    @IBOutlet weak var priceDescriptionForSelectedCurrencyLabel : UILabel?
    
    /** ImageView for selected item image. */
    @IBOutlet weak var goodImageView : UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
}
