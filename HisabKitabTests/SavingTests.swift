//
//  SavingTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 17/09/2021.
//

import XCTest
@testable import HisabKitab

class SavingTests: XCTestCase {

    var sut: SavingsViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "SavingsViewController")
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws // runs after every test
    {
        sut = nil
        try super.tearDownWithError()
    }
    
//MARK:- ViewController Tests
    
    func testVerifySavingsTotalAmountLabel()
    {
        XCTAssert((sut.savingsTotalAmountLabel != nil))
    }
    
    func testVerifySavingsRemainingLabel()
    {
        XCTAssert((sut.savingsRemainingLabel != nil))
    }
    
    func testVerifyCreateBtn()
    {
        XCTAssert((sut.createButton != nil))
    }
    
    func testVerifySavingProgressBar()
    {
        XCTAssert((sut.totalSavingProgressBar != nil))
    }


}
