//
//  SavingsViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit
var savingGoals = SavingGoals()

class SavingsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    
    var currentIndex:Int = 0
    var amount:Int = 0
    var addedAmount:Int = 0
    
    @IBOutlet weak var savingsTotalAmountLabel: UILabel!
    @IBOutlet weak var savingsRemainingLabel: UILabel!
    @IBOutlet weak var totalSavingProgressBar: UIProgressView!
    
    @IBOutlet weak var goalsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        savingsTotalAmountLabel.text = "PKR 0/0"
        savingsRemainingLabel.text = "Remaining: 0"
        totalSavingProgressBar.progress = 0
        
        goalsTable.delegate=self
        goalsTable.dataSource=self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
    }
    
    @objc func loadList()
    {
        var i = 0
        amount = 0
        addedAmount=0
        while i<savingGoals.savingArray.count
        {
            amount+=Int(savingGoals.savingArray[i][1])!
            addedAmount+=Int(savingGoals.savingArray[i][3])!
            i+=1
        }
        savingsRemainingLabel.text = "Remaining: \(amount-addedAmount)"
        savingsTotalAmountLabel.text = "PKR \(addedAmount)/\(amount)"
        totalSavingProgressBar.progress = Float(Float(addedAmount)/Float(amount))
        self.goalsTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if segue.identifier == "goToEachGoal"
       {

        let destView = segue.destination as! SavingGoalViewController
        destView.name = savingGoals.savingArray[currentIndex][0]
        destView.amount = savingGoals.savingArray[currentIndex][1]
        destView.ind = currentIndex


        }
    }

//MARK: - TableViewDelegateFunctions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingGoals.savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = savingGoals.displayGoals(ind: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = Int(indexPath.row)
        self.performSegue(withIdentifier: "goToEachGoal", sender: self)
    }
    
    

}
