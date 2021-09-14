//
//  SavingsViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 13/09/2021.
//

import UIKit

class SavingsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    

    @IBOutlet weak var goalsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsTable.delegate=self
        goalsTable.dataSource=self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadSavings"), object: nil)
    }
    @objc func loadList()
    {
        self.goalsTable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "\(savingArray[indexPath.row][2]): \(savingArray[indexPath.row][1]) (\(savingArray[indexPath.row][0]))"
        return cell
    }

}
