//
//  Account.swift
//  HisabKitab
//
//  Created by Rabbia on 08/09/2021.
//

import Foundation
import UIKit
class Account {
    var Balance:Int = 0
    var transactionArray:[[String]] = []
    var catBackground:[UIColor] = [UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) , UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ]
    var catTint:[UIColor] = [UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) , UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ]
    var transTypeBGColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
    var transTypeTint = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    func addIncome(income: Int) {
        Balance+=income
    }
    func addExpense(expense: Int) {
        Balance-=expense
    }
    func displayTransaction(ind:Int) -> String
    {
        return "\(transactionArray[ind][0]): \(transactionArray[ind][1])"
    }
    func iconColorState(state: String , ind:Int)
    {
        if state == "selected"
        {
            catBackground[ind] = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
            catTint[ind] = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        else if state == "released"
        {
            catBackground[ind] = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            catTint[ind] = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        }
        
    }
    
}
