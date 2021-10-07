//
//  AddGoalViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit
protocol PassSavingsDataToSavingGoalDelegate {
    func passAccountToSavingGoalVC(savingGoal:SavingGoals)
}

class AddGoalViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    var savingGoals = SavingGoals()

    @IBOutlet weak var goalDetails: UITextField!
    @IBOutlet weak var goalAmount: UITextField!
    @IBOutlet weak var goalDueDate: UIDatePicker!
    @IBOutlet weak var goalsTable: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    var currentIndex = 0
    var delegate: PassSavingsDataToSavingGoalDelegate?
    
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
    
    func alerts(detail:String, amount:String)
    {
        if detail == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Add a goal detail", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if amount.isInt == false || amount == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Add a number in Goal Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        if goalDetails.text! != ""  && goalAmount.text! != "" && goalAmount.text!.isInt
        {
            savingGoals.addSavingGoal(text: goalDetails.text!, amount: goalAmount.text!, date: goalDueDate.date)
            goalsTable.reloadData()
            delegate?.passAccountToSavingGoalVC(savingGoal: savingGoals)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
        }
        else {
            alerts(detail: goalDetails.text!, amount: goalAmount.text!)
        }
        goalDetails.text = nil
        goalAmount.text = nil
        
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        let targetVC = navigationController?.viewControllers.first(where: {$0 is SavingsViewController})
        if let destVC = targetVC {
           navigationController?.popToViewController(destVC, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if segue.identifier == "goToEachGoalFromCreateGoal"
       {
        let destView = segue.destination as! SavingGoalViewController
        destView.name = savingGoals.savingArray[currentIndex][0]
        destView.amount = savingGoals.savingArray[currentIndex][1]
        destView.ind = currentIndex
           destView.savingGoals = savingGoals
        }
    }

//MARK: - TableViewDelegateFunctions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingGoals.savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = savingGoals.displayGoals(ind: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = Int(indexPath.row)
        self.performSegue(withIdentifier: "goToEachGoalFromCreateGoal", sender: self)
    }

}
