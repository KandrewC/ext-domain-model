//
//  CustomStringConvertibleTests.swift
//  SimpleDomainModel
//
//  Created by Andrew Kan on 10/17/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

class CustomStringConvertibleTests: XCTestCase {

    func testMoney() {
        let tenUSD = Money(amount: 10, currency: "USD")
        XCTAssert(tenUSD.description == "USD10.0")
    }
    
    func testJob() {
        let testJob1 = Job(title: "Student", type: Job.JobType.Salary(-10000))
        XCTAssert(testJob1.description == "Student Salary(-10000)")
        
        let testJob2 = Job(title: "Movie-Star", type: Job.JobType.Hourly(10000))
        XCTAssert(testJob2.description == "Movie-Star Hourly(10000.0)")

    }
    
    func testPerson() {
        let andrew = Person(firstName: "Andrew", lastName: "Kan", age: 20)
        XCTAssert(andrew.description == "[Person: firstName:Andrew lastName:Kan age:20 job:nil spouse:nil]")

        andrew.job = Job(title: "Student", type: Job.JobType.Salary(-10000))
        XCTAssert(andrew.description == "[Person: firstName:Andrew lastName:Kan age:20 job:Student Salary(-10000) spouse:nil]")
        
        andrew.spouse = Person(firstName: "Some", lastName: "Person", age: 20)
        XCTAssert(andrew.description == "[Person: firstName:Andrew lastName:Kan age:20 job:Student Salary(-10000) spouse:Some Person]")
    }

    func testFamily() {
        
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        let family = Family(spouse1: ted, spouse2: charlotte)
        XCTAssert(family.description == "[Members:  Ted Neward Charlotte Neward | Household Income: 1000]")
        
        //new child
        let matt = Person(firstName: "Matt", lastName: "Neward", age: 16)
        family.haveChild(matt)
        XCTAssert(family.description == "[Members:  Ted Neward Charlotte Neward Matt Neward | Household Income: 1000]")
        
        //child with income
        let mike = Person(firstName: "Mike", lastName: "Neward", age: 22)
        mike.job = Job(title: "Burger-Flipper", type: Job.JobType.Hourly(5.5))
        family.haveChild(mike)
        XCTAssert(family.description == "[Members:  Ted Neward Charlotte Neward Matt Neward Mike Neward | Household Income: 12000]")
    }
}
