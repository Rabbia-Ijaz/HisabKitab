//
//  SavingTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 16/09/2021.
//

import XCTest
@testable import HisabKitab

class SavingTests: XCTestCase {

    var savingObj:SavingGoals!
    
    var sut: AddGoalViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        savingObj = SavingGoals()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "AddGoalViewController")
        sut.loadViewIfNeeded()
    }
    override func tearDownWithError() throws // runs after every test
    {
        savingObj = nil
        sut = nil
        try super.tearDownWithError()
    }

//MARK:- Model Tests
    
    func testAddSavingGoal()
    {
        let date = Date()

        savingObj.addSavingGoal(text: "Goal1", amount: "600", date: date )
        let size = savingObj.savingArray.count
        
        XCTAssertEqual(savingObj.savingArray[size-1][0], "Goal1")
        XCTAssertEqual(savingObj.savingArray[size-1][1], "600")
        XCTAssertEqual(savingObj.savingArray[size-1][2], savingObj.dateConverter(dateInString: date.description))
        XCTAssertEqual(savingObj.progressArray[size-1][0],0)

    }
    
    func testAddProgress()
    {
        let date = Date()

        savingObj.addSavingGoal(text: "Goal1", amount: "600", date: date )
        let size = savingObj.savingArray.count
        
        
        savingObj.addProgress(addAmount: 500, ind: size-1)
        let size2 = savingObj.progressArray[size-1].count
        XCTAssertEqual(savingObj.progressArray[size-1][size2-1],500)
    }
    


}
