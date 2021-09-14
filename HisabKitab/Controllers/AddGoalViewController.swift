//
//  AddGoalViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit
//var savingArray: [[String]] = []
class AddGoalViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var goalDetails: UITextField!
    @IBOutlet weak var goalAmount: UITextField!
    @IBOutlet weak var goalDueDate: UIDatePicker!
    @IBOutlet weak var goalsTable: UITableView!
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.delegate=self
        goalsTable.dataSource=self

        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadAddGoals"), object: nil)
    }
    
    @objc func loadList()
    {
        self.goalsTable.reloadData()
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
            savingGoals.savingArray.append([goalDetails.text!,goalAmount.text!,dateConverter(dateInString: goalDueDate.date.description),"0"])
            savingGoals.progressArray.append([0])
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
        
        print(savingGoals.savingArray)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if segue.identifier == "goToEachGoalFromCreateGoal"
       {

        let destView = segue.destination as! SavingGoalViewController
        destView.name = savingGoals.savingArray[currentIndex][0]
        destView.amount = savingGoals.savingArray[currentIndex][1]
        destView.ind = currentIndex


        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingGoals.savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = "\(savingGoals.savingArray[indexPath.row][2]): \(savingGoals.savingArray[indexPath.row][0]) (PKR \(savingGoals.savingArray[indexPath.row][3])/\(savingGoals.savingArray[indexPath.row][1]))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = Int(indexPath.row)
        self.performSegue(withIdentifier: "goToEachGoalFromCreateGoal", sender: self)
    }

}
