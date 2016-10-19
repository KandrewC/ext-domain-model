//
//  DoubleTests.swift
//  SimpleDomainModel
//
//  Created by Andrew Kan on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

class DoubleExtensionsTests: XCTestCase {

    func testingUSD() {
        let oneHundredUSD = 100.0
        let converted = oneHundredUSD.USD
        XCTAssert(converted.amount == 100)
        XCTAssert(converted.currency == "USD")
    }
    
    func testingGBP() {
        let tenGBP = 10.0
        let converted = tenGBP.GBP
        XCTAssert(converted.amount == 10)
        XCTAssert(converted.currency == "GBP")
    }
    
    func testingEUR() {
        let fiveEUR = 5.0
        let converted = fiveEUR.EUR
        XCTAssert(converted.amount == 5)
        XCTAssert(converted.currency == "EUR")
    }
    
    func testingCAN() {
        let negOneCAN = -1.0
        let converted = negOneCAN.CAN
        XCTAssert(converted.amount == -1)
        XCTAssert(converted.currency == "CAN")
    }

}
