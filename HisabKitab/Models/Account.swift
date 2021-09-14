//
//  Account.swift
//  HisabKitab
//
//  Created by Rabbia on 08/09/2021.
//

import Foundation
class Account {
    var Balance:Int = 0
    
    func addIncome(income: Int) {
        Balance+=income
    }
    func addExpense(expense: Int) {
        Balance-=expense
    }
    
}
