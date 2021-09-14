//
//  ViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 06/09/2021.
//

import UIKit

class ReminderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    
    @IBOutlet weak var reminderDetails: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    var reminder = Reminders()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        if reminderDetails.text! != ""
        {
            reminder.addNewReminder(text: reminderDetails.text!, date: dateConverter(dateInString: datePicker.date.description))
            tableView.reloadData()
            reminderDetails.text = nil
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Add Reminder Details", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return reminder.remindersData.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "reminder", for: indexPath)
        cell.textLabel!.text = "\(reminder.remindersData[indexPath.row][0]): \(reminder.remindersData[indexPath.row][1])"
        return cell
    }


}

