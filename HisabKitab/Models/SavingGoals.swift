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
    
    func displayGoals(ind:Int) ->String
    {
        return "\(savingArray[ind][2]): \(savingArray[ind][0]) (PKR \(savingArray[ind][3])/\(savingArray[ind][1]))"
    }
    
    func addSavingGoal(text:String, amount:String , date:Date){
        savingArray.append([text,amount,dateConverter(dateInString: date.description),"0"])
        progressArray.append([0])
    }
    
    func dateConverter(dateInString: String) -> String
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: dateInString) {
            print(dateFormatterPrint.string(from: date))
            return dateFormatterPrint.string(from: date)
        } else {
            return "There was an error decoding the string"
        }
    }
}
