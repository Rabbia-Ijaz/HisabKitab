//
//  SavingGoalViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 14/09/2021.
//

import UIKit



extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

class SavingGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var name:String = "name"
    var amount:String = "0"
    var ind:Int = 0
   
    
    @IBOutlet weak var savingGoalName: UILabel!
    @IBOutlet weak var savingGoalAmount: UILabel!
    @IBOutlet weak var savingGoalProgressBar: UIProgressView!
    @IBOutlet weak var goalProgressTextBox: UITextField!
    @IBOutlet weak var goalProgressTable: UITableView!
    @IBOutlet weak var goalProgressRemaining: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalProgressTable.delegate = self
        goalProgressTable.dataSource = self
        
        let remaining = Int(amount)! - Int(savingGoals.savingArray[ind][3])!
        savingGoalName.text! = name
        savingGoalAmount.text! = "PKR \(savingGoals.savingArray[ind][3])/\(amount)"
        goalProgressRemaining.text! = "Remaining: \(remaining)"
        savingGoalProgressBar.progress = Float(Float(savingGoals.savingArray[ind][3])!/Float(amount)!)
       // goalProgressArray.append(Int(savingGoals.savingArray[ind][3])!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        
        var remainingAmount = Int(amount)! - savingGoals.progressArray[ind].reduce(0, +)
        
        if goalProgressTextBox.text! != "" && goalProgressTextBox.text!.isInt
        {
            if Int(goalProgressTextBox.text!)! <= remainingAmount
            {
                savingGoals.progressArray[ind].append(Int(goalProgressTextBox.text!)!)
                let totalSum = savingGoals.progressArray[ind].reduce(0, +)
                savingGoalProgressBar.progress = Float(Float(totalSum)/Float(amount)!)
                //savingGoals.progressArray[ind].append(Int(goalProgressTextBox.text!)!)
                
            }
            if Int(goalProgressTextBox.text!)! > remainingAmount
            {
                let alert = UIAlertController(title: "Alert", message: "Progress Amount cannot exceed the Remaining amount", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        else if goalProgressTextBox.text!.isInt == false
        {
            let alert = UIAlertController(title: "Alert", message: "Add a number in Goal Progress", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        goalProgressTable.reloadData()
        goalProgressTextBox.text = nil
        remainingAmount = Int(amount)! - savingGoals.progressArray[ind].reduce(0, +)
        goalProgressRemaining.text! = "Remaining: \(remainingAmount)"
        savingGoalAmount.text! = "PKR \(savingGoals.progressArray[ind].reduce(0, +))/\(amount)"
        savingGoals.savingArray[ind][3]=String(savingGoals.progressArray[ind].reduce(0, +))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAddGoals"), object: nil)

        
    }
    
    @IBAction func setGoalAsAchievedPressed(_ sender: Any) {
        savingGoals.savingArray.remove(at: ind)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savingGoals.progressArray[ind].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = "Added: \(savingGoals.progressArray[ind][indexPath.row+1])"
        return cell
    }
    

}
