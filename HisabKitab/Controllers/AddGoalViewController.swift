//
//  AddGoalViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit
var savingArray: [[String]] = []
class AddGoalViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var goalDetails: UITextField!
    @IBOutlet weak var goalAmount: UITextField!
    @IBOutlet weak var goalDueDate: UIDatePicker!
    @IBOutlet weak var goalsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.delegate=self
        goalsTable.dataSource=self

        
    }
    
    func dateConverter(dateInString: String) -> String  {
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
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        if goalDetails.text! != ""  && goalAmount.text! != "" && goalAmount.text!.isInt
        {
            savingArray.append([goalDetails.text!,goalAmount.text!,dateConverter(dateInString: goalDueDate.date.description),"0"])
            goalDetails.text = nil
            goalAmount.text = nil
            goalsTable.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
        }
        
        else if goalAmount.text!.isInt == false
        {
            let alert = UIAlertController(title: "Alert", message: "Add a number in Goal Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        print(savingArray)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "\(savingArray[indexPath.row][2]): \(savingArray[indexPath.row][0]) (PKR \(savingArray[indexPath.row][3])/\(savingArray[indexPath.row][1]))"
        return cell
    }

}
