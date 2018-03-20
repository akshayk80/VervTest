//
//  ViewController.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import UIKit

let kRowHeight : CGFloat = 64

/** currency for which rates needs to be retrived. */
let kGBPCurrencyItem = CurrencyItem(code: "Gbp", currencyName: "GBP")

class GoodsViewController: UITableViewController
{
    /** View Model for each Goods item. */
    var goodsItemViewModel = GoodsItemViewModel()
    
    /** segue id from goods view controller to checkout view controller. */
    private let segueId : String = "GoodsViewControllerToCheckoutViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        goodsItemViewModel.setupGoods()
        
        self.title = NSLocalizedString("Goods", comment: "")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.rowHeight = kRowHeight
        self.tableView.accessibilityIdentifier = "LPGoodsTableViewId"
        
        
    }

    // MARK: Events
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == segueId
        {
            let checkoutVC = segue.destination as! CheckoutViewController
            let selectedGoodsItemViewModel = SelectedGoodsItemViewModel(goodItems: goodsItemViewModel.selectedGoodsItems())
            checkoutVC.selectedGoodsItemViewModel = selectedGoodsItemViewModel
        }
    }

    // MARK: UITableViewDelegate Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return goodsItemViewModel.numberOfItemsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodCell", for: indexPath) as! GoodCell
        
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: Methods
    
    /**
     Configure cell elements (name, price, quantity, icon image).
     @param cell to configure.
     @param indexPath for the cell to configure.
     */
    func configureCell(cell: GoodCell, indexPath: IndexPath)
    {
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.goodCellDelegate = self
        cell.updateButtons(tag: indexPath.row)
        cell.titleLabel?.text = goodsItemViewModel.titleForItemAtIndexPath(indexPath: indexPath)
        cell.priceDescriptionLabel?.text = goodsItemViewModel.priceDescriptionForItemAtIndexPath(indexPath: indexPath)
        
        cell.goodImageView?.image = goodsItemViewModel.imageForItemAtIndexPath(indexPath: indexPath)
        cell.goodImageView?.contentMode = UIViewContentMode.scaleAspectFit
        cell.quantityLabel?.text = "\(goodsItemViewModel.quantityForItemAt(indexPath: indexPath))"
    }
    
}

extension GoodsViewController: GoodCellDelegate
{
    /**
     Called when user tap add button for an item to update the quantity for that item.
     @param button with tag as row id.
     */
    func addItemTapped(sender: UIButton)
    {
        updateQuantityFor(row: sender.tag, valueBy: 1)
    }
    
    /**
     Called when user tap remove button for an item to update the quantity for that item.
     @param button with tag as row id.
     */
    func removeItemTapped(sender: UIButton)
    {
        updateQuantityFor(row: sender.tag, valueBy: -1)
    }
    
    /**
     Updates the quantity of an item based on user selection and reload tableView.
     @param row to update.
     @param valueBy increment or decrement i.e. 1 or -1.
     */
    private func updateQuantityFor(row : Int, valueBy: Int)
    {
        let indexPath : IndexPath = IndexPath(row: row, section: 0)
        let newQuantity : Int = goodsItemViewModel.quantityForItemAt(indexPath: indexPath) + valueBy
        if newQuantity >= 0
        {
            goodsItemViewModel.updateQuantityForItemAt(indexPath: indexPath, quantity: newQuantity)
        }
        
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
}

