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

class SavingGoalViewController: UIViewController {
    
    var goalProgressArray:[Int]=[]
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
        let remaining = Int(amount)! - Int(savingArray[ind][3])!
        savingGoalName.text! = name
        savingGoalAmount.text! = "PKR \(savingArray[ind][3])/\(amount)"
        goalProgressRemaining.text! = "Remaining: \(remaining)"
        savingGoalProgressBar.progress = Float(Float(savingArray[ind][3])!/Float(amount)!)
        goalProgressArray.append(Int(savingArray[ind][3])!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        
        var remainingAmount = Int(amount)! - goalProgressArray.reduce(0, +)
        
        if goalProgressTextBox.text! != ""
        {
            if goalProgressTextBox.text!.isInt && Int(goalProgressTextBox.text!)! <= remainingAmount
            {
                goalProgressArray.append(Int(goalProgressTextBox.text!)!)
                let totalSum = goalProgressArray.reduce(0, +)
                savingGoalProgressBar.progress = Float(Float(totalSum)/Float(amount)!)

                
            }
            if Int(goalProgressTextBox.text!)! > remainingAmount
            {
                let alert = UIAlertController(title: "Alert", message: "Progress Amount cannot exceed the Remaining amount", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if goalProgressTextBox.text!.isInt == false
            {
                let alert = UIAlertController(title: "Alert", message: "Add a number in Goal Progress", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
        
        
        goalProgressTextBox.text = nil
        remainingAmount = Int(amount)! - goalProgressArray.reduce(0, +)
        goalProgressRemaining.text! = "Remaining: \(remainingAmount)"
        savingGoalAmount.text! = "PKR \(goalProgressArray.reduce(0, +))/\(amount)"
        savingArray[ind][3]=String(goalProgressArray.reduce(0, +))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)

        
    }
    
    @IBAction func setGoalAsAchievedPressed(_ sender: Any) {
        savingArray.remove(at: ind)
       // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
    }
    

}
