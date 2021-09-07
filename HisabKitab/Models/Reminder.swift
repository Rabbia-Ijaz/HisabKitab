//
//  Reminder.swift
//  HisabKitab
//
//  Created by Rabbia on 07/09/2021.
//

import Foundation
class Reminders {
    
    var remindersData:[[String]]=[]
    
    func addNewReminder(text: String, date : String){
        
        remindersData.append([date,text])
        
    }
}
