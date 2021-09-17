//
//  HomeTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 17/09/2021.
//

import XCTest
@testable import HisabKitab

class HomeTests: XCTestCase {

    var sut: HomeViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "HomeViewController")
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws // runs after every test
    {
        sut = nil
        try super.tearDownWithError()
    }
    
//MARK:- ViewController Tests
    
    func testVerifyTransactionTable()
    {
        XCTAssert((sut.transactionTable != nil))
    }
    
    func testVerifyBudgetTable()
    {
        XCTAssert((sut.budgetTable != nil))
    }
    
    func testVerifyremainingBalance()
    {
        XCTAssert((sut.remainingBalance != nil))
    }


}
