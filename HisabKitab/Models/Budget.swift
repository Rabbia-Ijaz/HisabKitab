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
    
    func categoryExist(catInd:Int) ->Int
    {
        var i = 0
        while i < budgetArray.count
        {
            if budgetArray[i][0] == category.categoryIcons[catInd]
            {
                print(i)
                return i
            }
            i+=1
        }
        return -1
    }
    
    func addInBudget(Ind:Int, amount:String)
    {
        let temp: Int = Int(budgetArray[Ind][1])! + Int(amount)!
        budgetArray[Ind][1] = String(temp)
    }
    
    func displayBudget(ind:Int) ->String
    {
        if(budgetArray.count != 0)
        {
            return "\(budgetArray[ind][0]): \(budgetArray[ind][1])"
        }
        else{
            return "None"
        }
        
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
