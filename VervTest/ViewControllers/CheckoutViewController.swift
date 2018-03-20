//
//  CheckoutViewController.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit

class CheckoutViewController: UITableViewController
{
    /** View Model for each selected goods item. */
    var selectedGoodsItemViewModel : SelectedGoodsItemViewModel?
    
    /** Selected currency by the user. */
    var selectedRate : CurrencyItem?
    
    /** segue id from checkout view controller to rates view controller. */
    private let segueId : String = "CheckoutViewControllerToRatesViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = NSLocalizedString("Basket", comment: "")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.accessibilityIdentifier = "LPSelectedGoodsTableViewId"
        
        /** Currency button to load the current rates for GBP. */
        let currencyButton = UIBarButtonItem(title: NSLocalizedString("Currency", comment: ""), style: UIBarButtonItemStyle.plain, target: self, action: #selector(currencyTapped))
        self.navigationItem.rightBarButtonItem = currencyButton
    }
    
    /**
     Load CurrencyViewController for the latest currency rates for GBP.
     */
    @objc func currencyTapped()
    {
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == segueId
        {
            let ratesVC = segue.destination as! RatesViewController
            ratesVC.rateDelegate = self
        }
    }
    
    // MARK: UITableViewDelegate Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return selectedGoodsItemViewModel?.numberOfItemsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedGoodCell", for: indexPath) as! SelectedGoodCell
        
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: Methods
    
    /**
     Configure cell elements (name, price, icon image).
     @param cell to configure.
     @param indexPath for the cell to configure.
     */
    func configureCell(cell: SelectedGoodCell, indexPath: IndexPath)
    {
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.titleLabel?.text = selectedGoodsItemViewModel?.titleForItemAtIndexPath(indexPath: indexPath)
        cell.priceDescriptionLabel?.text = selectedGoodsItemViewModel?.priceDescriptionForItemAtIndexPath(indexPath: indexPath)
        cell.priceDescriptionForSelectedCurrencyLabel?.text = selectedGoodsItemViewModel?.priceDescriptionForSelectedCurrencyForItemAtIndexPath(indexPath: indexPath)
        
        cell.goodImageView?.image = selectedGoodsItemViewModel?.imageForItemAtIndexPath(indexPath: indexPath)
        cell.goodImageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
}

extension CheckoutViewController: RateDelegate
{
    /**
     Call back when user selects a rate from the RatesViewController tableView.
     @param rateItem selected rate by user.
     */
    func chosenRate(rateItem: RateItem)
    {
        selectedGoodsItemViewModel?.updateCurrency(rateItem: rateItem)
        tableView.reloadData()
    }
}
    


