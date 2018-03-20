//
//  GoodCellDelegate.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import UIKit

protocol GoodCellDelegate: NSObjectProtocol
{
    func addItemTapped(sender: UIButton)
    func removeItemTapped(sender: UIButton)
}
