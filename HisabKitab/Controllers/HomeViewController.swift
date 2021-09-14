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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionTable.delegate=self
        transactionTable.dataSource=self
        budgetTable.delegate=self
        budgetTable.dataSource=self
        
        remainingBalance.text = "PKR \(account.Balance)"
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

        // Do any additional setup after loading the view.
    }
    
    @objc func loadList()
    {
        //load data here
        //remainingBalance.text = "PKR \(account.Balance)"
        //self.remainingBalance.reloadInputViews()
        self.budgetTable.reloadData()
        self.transactionTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
                
        if tableView == self.budgetTable {
            count = budgetArray.count
        }
        
        if tableView == self.transactionTable {
            count =  transactionArray.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath)
//        return cell
        
        var cell:UITableViewCell?
                
        if tableView == self.budgetTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath)
            cell!.textLabel!.text = "\(budgetArray[indexPath.row][0]): \(budgetArray[indexPath.row][1])"

        }
        
        if tableView == self.transactionTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "transaction", for: indexPath)
            cell!.textLabel!.text = "\(transactionArray[indexPath.row][0]): \(transactionArray[indexPath.row][1])"
            remainingBalance.text = "PKR \(account.Balance)"
            
        }
        return cell!
    }

}
