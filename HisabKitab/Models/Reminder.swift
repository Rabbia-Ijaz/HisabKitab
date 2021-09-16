//
//  Reminder.swift
//  HisabKitab
//
//  Created by Rabbia on 07/09/2021.
//

import Foundation
class Reminders {
    
    var remindersData:[[String]]=[]
    
    func addNewReminder(text: String, date : Date)
    {
        let dateConverted = dateConverter(dateInString: date.description)
        remindersData.append([dateConverted,text])
    }
    
    func dateConverter(dateInString: String) -> String  {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy h:mm a"

        if let date = dateFormatterGet.date(from: dateInString) {
            print(dateFormatterPrint.string(from: date))
            return dateFormatterPrint.string(from: date)
        } else {
            return "There was an error decoding the string"
        }
    }
}
