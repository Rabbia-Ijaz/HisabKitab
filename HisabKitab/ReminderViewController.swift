//
//  ViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 06/09/2021.
//

import UIKit

class ReminderViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var reminderDetails: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderTable.delegate = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        print( reminderDetails.text! , datePicker.date)
        
        
    }
    
    

}

