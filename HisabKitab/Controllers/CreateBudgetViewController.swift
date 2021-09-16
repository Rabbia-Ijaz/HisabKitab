//
//  CreateBudgetViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 09/09/2021.
//

import UIKit
var budget = Budget()
var category = Category()

class CreateBudgetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var selectedCat = false
    var catInd:Int = 0
    
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var budgetTable: UITableView!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionCategory.delegate=self
        collectionCategory.dataSource=self
        budgetTable.delegate=self
        budgetTable.dataSource=self
        
    }
    
    func alerts(cat:Bool , amount:String)
    {
        if amount.isInt == false
        {
            let alert = UIAlertController(title: "Alert", message: "Add a number in Budget Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if cat != true
        {
            let alert = UIAlertController(title: "Alert", message: "Choose category icon", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    
    @IBAction func finishPressed(_ sender: UIButton)
    {
        
        if selectedCat && budgetTextField.text! != "" && budgetTextField.text!.isInt
        {
            let i = budget.categoryExist(catInd: catInd)
            if  i != -1
            {
                budget.addInBudget(Ind: i, amount: budgetTextField.text!)
            }
            
            else
            {
                budget.appendInBudget(cat: category.categoryIcons[catInd], amount: budgetTextField.text!)
            }
            
            budgetTable.reloadData()
            collectionCategory.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        else{            
            alerts(cat: selectedCat, amount: budgetTextField.text!)
        }
        budgetTextField.text = nil
        selectedCat = false
    }
    
// MARK: - CollectionViewDelegateFunctions

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return category.categoryIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = budget.catBackground[indexPath.row]
        if let icon = cell.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = budget.catTint[indexPath.row]
        }
        if let iconLabel = cell.viewWithTag(200) as? UILabel{
            iconLabel.text = category.categoryIcons[indexPath.row]
            iconLabel.textColor = budget.catTint[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        budget.iconColorState(state: "selected", ind: indexPath.row)
        cell!.backgroundColor = budget.catBackground[indexPath.row]
      
        if let icon = cell!.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = budget.catTint[indexPath.row]
        }
        if let iconLabel = cell?.viewWithTag(200) as? UILabel{
            iconLabel.textColor = budget.catTint[indexPath.row]
        }
        
        budget.iconColorState(state: "released", ind: indexPath.row)
        catInd = indexPath.row
        selectedCat = true
    }
    
// MARK: - TableViewDelegateFunctions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return budget.budgetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath)
        cell.textLabel!.text = budget.displayBudget(ind: indexPath.row)
        return cell
    }
}
