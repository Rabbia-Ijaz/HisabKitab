//
//  HomeViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit

class HomeViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var transactionTable: UITableView!
    @IBOutlet weak var budgetTable: UITableView!
    @IBOutlet weak var remainingBalance: UILabel!
    var budget = Budget()
    var account = Account()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        transactionTable.delegate=self
        transactionTable.dataSource=self
        budgetTable.delegate=self
        budgetTable.dataSource=self
        
        
        remainingBalance.text = "PKR \(account.Balance)"
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    //Write the PrepareForSegue Method here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "homeToCreateBudget" {
            let destinationVC = segue.destination as! CreateBudgetViewController
            destinationVC.delegate = self
        }
        
        if segue.identifier == "HomeToTransaction" {
            let destinationVC = segue.destination as! AddTransactionViewController
            destinationVC.delegate = self
        }
    
    }
    
    @objc func loadList()
    {
        self.budgetTable.reloadData()
        self.transactionTable.reloadData()
    }

// MARK: - TableViewDelegateFunctions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count:Int?
        if tableView == self.budgetTable
        {
            count = budget.budgetArray.count
        }
        if tableView == self.transactionTable
        {
            count =  account.transactionArray.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell?
                
        if tableView == self.budgetTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath)
            cell!.textLabel!.text = budget.displayBudget(ind: indexPath.row)
        }
        if tableView == self.transactionTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "transaction", for: indexPath)
            cell!.textLabel!.text = account.displayTransaction(ind: indexPath.row)
            remainingBalance.text = "PKR \(account.Balance)"
        }
        return cell!
    }

}

//MARK: - PassDataToHomeDelegate
extension HomeViewController:PassDataToHomeDelegate {
    func passBudgetToHomeVC(bdgt: Budget) {
        print("Booo")
        for item in bdgt.budgetArray {
            budget.budgetArray.append(item)
        }
        
    }
    
    
}

//MARK: - PassAccountDataToHomeDelegate
extension HomeViewController:PassAccountDataToHomeDelegate {
    func passAccountToHomeVC(accnt: Account) {
        print("Booo")
        for item in accnt.transactionArray {
            account.transactionArray.append(item)
            
        }
        account.Balance += accnt.Balance
    }
    
}
    
