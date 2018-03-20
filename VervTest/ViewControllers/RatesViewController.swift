//
//  RatesViewController.swift
//  VervTest
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import Foundation
import UIKit

class RatesViewController: UITableViewController
{
    weak var rateDelegate : RateDelegate?
    
    /** rates view model for retrived rates for a chosen currency. */
    private let rateViewModel = RateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Rates for GBP", comment: "")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.accessibilityIdentifier = "LPRatesTableViewId"
        
        fetchRates()
    }
    
    // MARK: UITableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return rateViewModel.numberOfItemsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateCell
        
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let rateItem : RateItem = self.rateViewModel.rateItemItemAtIndexPath(indexPath: indexPath)
        self.rateDelegate?.chosenRate(rateItem: rateItem)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Methods
    
    /**
     Configure cell elements (currency code, rate value).
     @param cell to configure.
     @param indexPath for the cell to configure.
     */
    func configureCell(cell: RateCell, indexPath: IndexPath)
    {
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.currencyCodeLabel?.text = rateViewModel.currencyCodeForItemAtIndexPath(indexPath: indexPath)
        cell.rateValueLabel?.text = rateViewModel.rateDescriptionForItemAtIndexPath(indexPath: indexPath)
    }
    
    /**
     Fetch rates for given currency.
     @param currencyCode for which to fetch the rates.
     */
    func fetchRates()
    {
        rateViewModel.fetchCurrencyRates(currencyCode: kGBPCurrencyItem.code) {
            
            DispatchQueue.main.async {
                
                if self.rateViewModel.hasItems()
                {
                    self.tableView.reloadData()
                }
                else
                {
                    let alertController : UIAlertController = UIAlertController(title: NSLocalizedString("Error getting data", comment: ""), message: NSLocalizedString("Please check if you have internet connection or try again later", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

