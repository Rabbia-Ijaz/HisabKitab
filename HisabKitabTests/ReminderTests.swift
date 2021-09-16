//
//  ReminderTests.swift
//  HisabKitabTests
//
//  Created by Rabbia on 16/09/2021.
//

import XCTest
@testable import HisabKitab
class ReminderTests: XCTestCase {

    var reminderObj:Reminders!
    
    var sut: ReminderViewController!
    
    override func setUpWithError() throws //like viewDidLoad()
    {
        try super.setUpWithError()
        reminderObj = Reminders()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "ReminderViewController")
        sut.loadViewIfNeeded()
    }
    override func tearDownWithError() throws // runs after every test
    {
        reminderObj = nil
        sut = nil
        try super.tearDownWithError()
    }

//MARK:- Model Tests
    func testAddNewReminder()
    {
        reminderObj.addNewReminder(text: "Reminder1", date: Date())
        let size = reminderObj.remindersData.count
        XCTAssertEqual(reminderObj.remindersData[size-1][1], "Reminder1")
    }
    
//MARK:- ViewController Tests
    func testVerifyReminderDetails()
    {
        XCTAssertNotNil(sut.reminderDetails)
    }
    
    func testVerifyDatePicker()
    {
        XCTAssertNotNil(sut.datePicker)
    }
    
    func testVerifyTableView()
    {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testVerifyAddButton()
    {
        XCTAssertNotNil(sut.addButton)
    }

    func testAddReminder()
    {
        sut.reminderDetails.text="Reminder1"
        sut.addButtonPressed(sut.addButton!)
        
        let size =  reminder.remindersData.count
        XCTAssertEqual(reminder.remindersData[size-1][1], "Reminder1")
    }

}
