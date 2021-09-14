//
//  SavingGoals.swift
//  HisabKitab
//
//  Created by Rabbia on 14/09/2021.
//

import Foundation
class SavingGoals {
    var savingArray:[[String]]=[]
    var progressArray:[[Int]]=[]
    
    func addProgress(addAmount:Int, ind:Int)
    {
        progressArray[ind].append(addAmount)
    }
    
}
