//
//  SavingsViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit


class SavingsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    
    var currentIndex:Int = 0
    var amount:Int = 0
    var remainingAmount:Int = 0
    
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
        remainingAmount=0
        while i<savingArray.count{
            
            amount+=Int(savingArray[i][1])!
            remainingAmount+=Int(savingArray[i][3])!
            i+=1
        }
        savingsRemainingLabel.text = "Remaining: \(remainingAmount)"
        savingsTotalAmountLabel.text = "PKR \(remainingAmount)/\(amount)"
        totalSavingProgressBar.progress = Float(Float(remainingAmount)/Float(amount))
        self.goalsTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if segue.identifier == "goToEachGoal"
       {

        let destView = segue.destination as! SavingGoalViewController
        destView.name = savingArray[currentIndex][0]
        destView.amount = savingArray[currentIndex][1]
        destView.ind = currentIndex


        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "\(savingArray[indexPath.row][2]): \(savingArray[indexPath.row][0]) (PKR \(savingArray[indexPath.row][3])/\(savingArray[indexPath.row][1]))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = Int(indexPath.row)
        self.performSegue(withIdentifier: "goToEachGoal", sender: self)
    }
    
    

}
