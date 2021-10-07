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
    @IBOutlet weak var addButton: UIButton!
    var reminder = Reminders()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addButtonPressed(_ sender: Any)
    {
        if reminderDetails.text! != ""
        {
            reminder.addNewReminder(text: reminderDetails.text!, date: datePicker.date)
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

//MARK: - TableViewDelegateFunctions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return reminder.remindersData.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminder", for: indexPath)
        cell.textLabel!.text = "\(reminder.remindersData[indexPath.row][0]): \(reminder.remindersData[indexPath.row][1])"
        return cell
    }

}

