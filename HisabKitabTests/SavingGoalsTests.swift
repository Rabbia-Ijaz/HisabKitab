//
//  SavingGoalsTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 17/09/2021.
//

import XCTest
@testable import HisabKitab

class SavingGoalsTests: XCTestCase {
    
    var sut: SavingGoalViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        savingGoals = SavingGoals()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "SavingGoalViewController")
        savingGoals.addSavingGoal(text: "Goal1", amount: "5000", date: Date())
        savingGoals.addSavingGoal(text: "Goal2", amount: "15000", date: Date())
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws // runs after every test
    {
        sut = nil
        try super.tearDownWithError()
    }

//MARK:- ViewController Tests

    func testVerifySavingGoalName()
    {
        XCTAssertNotNil(sut.savingGoalName)
    }
    
    func testVerifySavingGoalAmount()
    {
        XCTAssertNotNil(sut.savingGoalAmount)
    }
    
    func testVerifySavingGoalProgressBar()
    {
        XCTAssertNotNil(sut.savingGoalProgressBar)
    }
    
    func testVerifyGoalProgressTextField()
    {
        XCTAssertNotNil(sut.goalProgressTextBox)
    }
    
    func testVerifyGoalProgressTable()
    {
        XCTAssertNotNil(sut.goalProgressTable)
    }
    
    func testVerifyGoalProgressRemaining()
    {
        XCTAssertNotNil(sut.goalProgressRemaining)
    }
    
    func testVerifyFinishBtn()
    {
        XCTAssertNotNil(sut.finishButton)
    }
    
    func testVerifySetGoalAsAchievedBtn()
    {
        XCTAssertNotNil(sut.setGoalAsAchievedButton)
    }
    
    func testFinishButtonPressedTrue()
    {
        sut.amount = "5000"
        sut.name = "Goal1"
        sut.ind = 0
        sut.goalProgressTextBox.text = "1000"
        
        sut.finishButtonPressed(sut.finishButton!)
        
        XCTAssertEqual(savingGoals.progressArray[0][1],Int("1000"))
        XCTAssertEqual(sut.goalProgressRemaining.text!, "Remaining: 4000")
    }
    
    func testFinishButtonPressedFalse()
    {
        sut.amount = "5000"
        sut.name = "Goal1"
        sut.ind = 0
        sut.goalProgressTextBox.text = "xyz"
        sut.finishButtonPressed(sut.finishButton!)
        print(savingGoals.progressArray[0].count)
        XCTAssertEqual(savingGoals.progressArray[0].count,1)
    }
    
    func testSetGoalAsAchievedBtn()
    {
        sut.amount = "5000"
        sut.name = "Goal1"
        sut.ind = 1
        
        sut.setGoalAsAchievedPressed(sut.setGoalAsAchievedButton!)
        
        print(savingGoals.savingArray)
        XCTAssertEqual(savingGoals.savingArray.count,1)
        XCTAssertEqual(savingGoals.savingArray[0][0], "Goal1")
    }
    
    
}
