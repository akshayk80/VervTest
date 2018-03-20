//
//  GoodCell.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit

/**
 Custom Table View Cell to display Goods.
 */
class GoodCell: UITableViewCell
{
    weak var goodCellDelegate : GoodCellDelegate?
    
    /** Label to display title of the item. */
    @IBOutlet weak var titleLabel : UILabel?
    
    /** Label to display price description for the item. */
    @IBOutlet weak var priceDescriptionLabel : UILabel?
    
    /** ImageView for item image. */
    @IBOutlet weak var goodImageView : UIImageView?
    
    /** add button to increment item quantity. */
    @IBOutlet weak var addButton : UIButton?
    
    /** remove button to decrement item quantity. */
    @IBOutlet weak var removeButton : UIButton?
    
    /** label to show item quantity. */
    @IBOutlet weak var quantityLabel : UILabel?
    
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
    
    /**
     Updates the tags for the add and remove buttons with row id of the cell they are in.
     @param tag for the item.
     */
    func updateButtons(tag : Int)
    {
        addButton?.tag = tag
        removeButton?.tag = tag
    }
    
    /**
     Called when add button tapped for a given item in a row.
     @param sender add button.
     */
    @IBAction func addItem(sender: UIButton)
    {
        goodCellDelegate?.addItemTapped(sender: sender)
    }
    
    /**
     Called when remove button tapped for a given item in a row.
     @param sender remove button.
     */
    @IBAction func removeItem(sender: UIButton)
    {
        goodCellDelegate?.removeItemTapped(sender: sender)
    }
}

