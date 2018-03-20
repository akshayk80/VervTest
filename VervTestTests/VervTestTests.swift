//
//  VervTestTests.swift
//  VervTestTests
//
//  Created by AkshayKapoor InternalTester01 on 2018/03/19.
//  Copyright © 2018 Verv. All rights reserved.
//

import XCTest
@testable import VervTest

class VervTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchRates()
    {
        let expect = expectation(description: "More than 10 Rates expected")
        let currencyRatesClient = CurrencyRatesClient()
        
        currencyRatesClient.fetchCurrencyRates(currencyCode: kGBPCurrencyItem.code) { ratesJsonObject in
            if let rates = ratesJsonObject?.rates
            {
                let count = rates.count
                XCTAssert(count != 0, "No results")
                XCTAssert(count > 10, "\(count) results returned, atleast 10 expected")
            }
            
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: { (error) in
            XCTAssertNil(error, "Timeout: \(error?.localizedDescription ?? ""))")
        })
    }
    
}
