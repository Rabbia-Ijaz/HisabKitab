//
//  Budget.swift
//  HisabKitab
//
//  Created by Rabbia on 09/09/2021.
//

import Foundation
class Budget {
    let category:Category = Category()
    var amount:[Int]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    func createBudget(catIndex:Int , catAmount: Int){
        //
        amount[catIndex] += catAmount
    }
    
    
    
}
