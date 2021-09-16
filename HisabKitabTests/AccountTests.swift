//
//  AccountTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 16/09/2021.
//

import XCTest
@testable import HisabKitab
class AccountTests: XCTestCase {

    var accountObj:Account!
    
    var sut: AddTransactionViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        accountObj = Account()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "AddTransactionViewController")
        sut.loadViewIfNeeded()
    }
    override func tearDownWithError() throws // runs after every test
    {
        accountObj = nil
        sut = nil
        try super.tearDownWithError()
    }

//MARK:- Model Tests
    func testAddIncome()
    {
        XCTAssertEqual(accountObj.Balance, 0)
        accountObj.addIncome(income: 500)
        XCTAssertEqual(accountObj.Balance, 500)
    }
    
    func testAddExpense()
    {
        accountObj.Balance = 1000
        
        accountObj.addExpense(expense: 500)
        XCTAssertEqual(accountObj.Balance, 500)
    }
    
    func testAddTransactionOne()
    {
        accountObj.addTransaction(transType: 1, cat: "Personal", amount: "500")
        let size = accountObj.transactionArray.count
        XCTAssertEqual(accountObj.Balance, 500)
        XCTAssertEqual(accountObj.transactionArray[size-1][0], "Personal")
        XCTAssertEqual(accountObj.transactionArray[size-1][1], "500")
    }
    
    func testAddTransactionTwo()
    {
        accountObj.Balance = 2000
        accountObj.addTransaction(transType: 2, cat: "Travel", amount: "1500")
        let size = accountObj.transactionArray.count
        XCTAssertEqual(accountObj.Balance, 500)
        XCTAssertEqual(accountObj.transactionArray[size-1][0], "Travel")
        XCTAssertEqual(accountObj.transactionArray[size-1][1], "-1500")
    }
    
    func testIconColorStateSelected()
    {
        accountObj.addTransaction(transType: 1, cat: "Personal", amount: "1500")
        accountObj.addTransaction(transType: 1, cat: "Travel", amount: "500")
        accountObj.addTransaction(transType: 2, cat: "Fun", amount: "1500")
       
        let ind = 2
        XCTAssertEqual(accountObj.catBackground[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) //before
        XCTAssertEqual(accountObj.catTint[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
        
        accountObj.iconColorState(state: "selected", ind: ind)
        
        XCTAssertEqual(accountObj.catBackground[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) //after
        XCTAssertEqual(accountObj.catTint[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    }
    
    func testIconColorStateReleased()
    {
        accountObj.addTransaction(transType: 1, cat: "Personal", amount: "1500")
        accountObj.addTransaction(transType: 1, cat: "Travel", amount: "500")
        accountObj.addTransaction(transType: 2, cat: "Fun", amount: "1500")
       
        let ind = 2
        
        accountObj.iconColorState(state: "released", ind: ind)
        
        XCTAssertEqual(accountObj.catBackground[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) //after
        XCTAssertEqual(accountObj.catTint[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
        
    }
    
//MARK:- ViewController Tests
    
    func testVerfiyIncomeBtn()
    {
        XCTAssertNotNil(sut.incomeButton)
    }
    
    func testVerfiyExpenseBtn()
    {
        XCTAssertNotNil(sut.expenseButton)
    }
    
    func testTransactionAmount()
    {
        XCTAssertNotNil(sut.transactionAmount)
    }
    
    func testCollectionCategory()
    {
        XCTAssertNotNil(sut.collectionCategory)
    }
    
    func testVerifyFinishBtn()
    {
        XCTAssertNotNil(sut.finishButton)
    }
    
    func testTransactionTable()
    {
        XCTAssertNotNil(sut.transactionTable)
    }
    
    func testTransactionTypeSelected()
    {
        sut.transactionTypeSelected(sut.incomeButton)
        
        XCTAssertEqual(sut.selectedTransType, true)
        XCTAssertEqual(sut.incomeButton.titleColor(for: .normal),#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
    }
    
    func testTransactionTypeNotSelected()
    {
        let button = UIButton()
        sut.transactionTypeSelected(button)
        XCTAssertEqual(sut.selectedTransType, false)
        XCTAssertNotEqual(sut.expenseButton.titleColor(for: .normal),#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
        XCTAssertNotEqual(sut.incomeButton.titleColor(for: .normal),#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))

    }
    
    func testFinishPressedTrue()
    {
        sut.selectedCat=true
        sut.selectedTransType = true
        sut.transType = 1 //income
        sut.transactionAmount.text = "1000"
        
        sut.finishPressed(sut.finishButton)
        var size = account.transactionArray.count
        XCTAssertEqual(account.transactionArray[size-1][1],"1000")
        XCTAssertEqual(account.Balance, 1000)
        
        
        sut.selectedCat=true
        sut.selectedTransType = true
        sut.transType = 2 //expense
        sut.transactionAmount.text = "100"
        sut.finishPressed(sut.finishButton)
        size = account.transactionArray.count
        XCTAssertEqual(account.transactionArray[size-1][1],"-100")
        XCTAssertEqual(account.Balance, 900)
    }

    func testFinishPressedFalse()
    {
        
        sut.finishPressed(sut.finishButton)
        XCTAssertEqual(account.transactionArray.count,0)
        XCTAssertEqual(account.Balance, 0)
        
    }

}
