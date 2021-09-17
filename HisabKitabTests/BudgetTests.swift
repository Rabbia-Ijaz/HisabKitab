//
//  BudgetTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 15/09/2021.
//
@testable import HisabKitab
import XCTest

class BudgetTests: XCTestCase
{

    var budgetObj:Budget!
    var sut: CreateBudgetViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        budgetObj = Budget()
        budget = Budget()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "CreateBudgetViewController")
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws // runs after every test
    {
        budgetObj = nil
        sut = nil
        try super.tearDownWithError()
    }
    
//MARK:- Model Tests
    func testAppendInBudget()
    {
        XCTAssertEqual(budgetObj.budgetArray.count, 0) //before
        
        let cat="Personal"
        let amount="500"
        budgetObj.appendInBudget(cat: cat, amount: amount)
        let size=budgetObj.budgetArray.count
        
        XCTAssertEqual(budgetObj.budgetArray.count, 1) //after
        XCTAssertEqual(budgetObj.budgetArray[size-1][0],cat)

    }
    
    func testCategoryExist()
    {
        budgetObj.appendInBudget(cat: "Personal", amount: "500") // index 0
        budgetObj.appendInBudget(cat: "Fun", amount: "1000") // index 3
        XCTAssertEqual(budgetObj.categoryExist(catInd: 0), 0) //exist
        XCTAssertNotEqual(budgetObj.categoryExist(catInd: 1), 1) //does not exist
        XCTAssertEqual(budgetObj.categoryExist(catInd: 3), 1) //exist answer is one because it is appending at postion 1 in budget array
    }
    
    func testAddInBudget()
    {
        budgetObj.appendInBudget(cat: "Personal", amount: "500") // index 0
        budgetObj.appendInBudget(cat: "Fun", amount: "1000") // index 3
        let ind = budgetObj.categoryExist(catInd: 3)
        budgetObj.addInBudget(Ind: ind, amount: "700") // adding at index 3
        XCTAssertEqual(budgetObj.budgetArray[ind][1],"1700") //total sum is 1700
        XCTAssertEqual(budgetObj.budgetArray.count, 2) //count remains the same
        
    }
    
    func testIconColorStateSelected()
    {
        budgetObj.appendInBudget(cat: "Personal", amount: "500") // index 0
        budgetObj.appendInBudget(cat: "Fun", amount: "1000") // index 3
        let ind = budgetObj.categoryExist(catInd: 3)
        
        XCTAssertEqual(budgetObj.catBackground[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) //before
        XCTAssertEqual(budgetObj.catTint[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
        
        budgetObj.iconColorState(state: "selected", ind: ind)
        
        XCTAssertEqual(budgetObj.catBackground[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) //after
        XCTAssertEqual(budgetObj.catTint[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    }
    
    func testIconColorStateReleased()
    {
        budgetObj.appendInBudget(cat: "Personal", amount: "500") // index 0
        budgetObj.appendInBudget(cat: "Fun", amount: "1000") // index 3
        let ind = budgetObj.categoryExist(catInd: 3)
       
        budgetObj.iconColorState(state: "released", ind: ind)
        
        XCTAssertEqual(budgetObj.catBackground[ind],#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) //before
        XCTAssertEqual(budgetObj.catTint[ind],#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1))
        
    }
    
    //MARK:- ViewController Tests
    func testFinishBtnVerify()
    {
        XCTAssertNotNil(sut.finishButton)
    }
    
    func testBudgetTextField()
    {
        XCTAssertNotNil(sut.budgetTextField)
    }
    
    func testCollectionCategory()
    {
        XCTAssertNotNil(sut.collectionCategory)
    }
    
    func testBudgetTable()
    {
        XCTAssertNotNil(sut.budgetTable)
    }
    
    func testFinishPressedTrueCaseWithAppend()
    {
        //if cat exists and budget textfield is not empty
    
        sut.budgetTextField.text = "500"
        sut.catInd = 1
        sut.selectedCat = true
        sut.finishPressed(sut.finishButton)
        XCTAssertEqual(budget.budgetArray[0][1] , "500")
        XCTAssertEqual(budget.budgetArray.count, 1)
        XCTAssertEqual(budget.displayBudget(ind: 0),"Transport: 500")
        
        sut.budgetTextField.text = "1500"
        sut.catInd = 2
        sut.selectedCat = true
        sut.finishPressed(sut.finishButton)
        XCTAssertEqual(budget.budgetArray[1][1] , "1500")
        XCTAssertEqual(budget.budgetArray.count, 2)
        XCTAssertEqual(budget.displayBudget(ind: 1),"Travel: 1500")
       
    }
    
    func testFinishPressedTrueCaseWithAdd()
    {
        //if cat exists and budget textfield is not empty

        sut.budgetTextField.text = "500"
        sut.catInd = 2
        sut.selectedCat = true
        sut.finishPressed(sut.finishButton)

        sut.budgetTextField.text = "1500"
        sut.catInd = 2
        sut.selectedCat = true
        sut.finishPressed(sut.finishButton)

        print(budget.budgetArray.count)

        XCTAssertEqual(budget.budgetArray[0][1] , "2000")
        XCTAssertEqual(budget.budgetArray.count, 1)
        
        XCTAssertEqual(budget.displayBudget(ind: 0),"Travel: 2000")

   }

    func testFinishPressedFalseCaseOne()
    {
        //if cat does not exists but budget textfield is not empty
        
        sut.finishButton.sendActions(for: .touchUpInside)
        sut.budgetTextField.text = "500"
        sut.finishPressed(sut.finishButton)
        
        XCTAssertEqual(budget.budgetArray.count, 0)
        
    }
    
    func testFinishPressedFalseCaseTwo()
    {
        //if cat exists but budget textfield is empty
       
        sut.finishButton.sendActions(for: .touchUpInside)
        sut.catInd = 2
        sut.selectedCat = true
        sut.finishPressed(sut.finishButton)
        
        XCTAssertEqual(budget.budgetArray.count, 0)
        
    }
    

}
  
