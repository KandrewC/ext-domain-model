//
//  MathematicsTests.swift
//  SimpleDomainModel
//
//  Created by Andrew Kan on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

class MathematicsTests: XCTestCase {

    let tenUSD = Money(amount: 10, currency: "USD")
    let twentyUSD = Money(amount: 20, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    
    func testAddUSDtoUSD() {
        let total = tenUSD.add(twentyUSD)
        XCTAssert(total.amount == 30)
        XCTAssert(total.currency == "USD")
    }
    
    func testAddUSDtoGBP() {
        let total = tenUSD.add(fiveGBP)
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == "GBP")
    }
    
    func testSubtractUSDtoUSD() {
        let total = tenUSD.subtract(twentyUSD)
        XCTAssert(total.amount == -10)
        XCTAssert(total.currency == "USD")
    }
    
    func testSubtractUSDtoGBP() {
        let total = twentyUSD.subtract(fiveGBP)
        XCTAssert(total.amount == 5)
        XCTAssert(total.currency == "GBP")
    }
}
