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
        print( reminderDetails.text! , datePicker.date)
        
        reminder.addNewReminder(text: reminderDetails.text!, date: datePicker.date.description)
        tableView.reloadData()
        
        
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

