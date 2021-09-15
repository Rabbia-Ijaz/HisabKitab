//
//  Budget.swift
//  HisabKitab
//
//  Created by Rabbia on 09/09/2021.
//

import Foundation
import UIKit
class Budget {
    
    var budgetArray:[[String]] = []
    var catBackground:[UIColor] = [UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) , UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ]
    var catTint:[UIColor] = [UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) , UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ]
    
    func appendInBudget(cat:String, amount:String)
    {
        budgetArray.append([cat , amount])
    }
    func addInBudget(ind:Int, amount:String)
    {
        let temp: Int = Int(budgetArray[ind][1])! + Int(amount)!
        budgetArray[ind][1] = String(temp)
    }
    func displayBudget(ind:Int) ->String
    {
        return "\(budgetArray[ind][0]): \(budgetArray[ind][1])"
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
