//
//  AddTransactionViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 08/09/2021.
//

import UIKit

protocol PassAccountDataToHomeDelegate {
    func passAccountToHomeVC(accnt:Account)
}

class AddTransactionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource
{
    var selectedTransType = false
    var transType = 0
    var selectedCat = false
    var catInd:Int = 0
    var category = Category()
    var account = Account()
    
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var transactionAmount: UITextField!
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var transactionTable: UITableView!
    var delegate: PassAccountDataToHomeDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionCategory.delegate=self
        collectionCategory.dataSource=self
        transactionTable.delegate=self
        transactionTable.dataSource=self

    }
    
    func alerts(cat:Bool , amount:String, transType:Bool)
    {
        if amount.isInt == false || amount == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Add a number in transaction Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if transType != true
        {
            let alert = UIAlertController(title: "Alert", message: "Choose a transaction type", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func transactionTypeSelected(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 2
        {
            selectedTransType=true
            transType = sender.tag
            sender.layer.borderWidth = 1
            sender.layer.borderColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
            sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            if sender.tag == 1
            {
                incomeButton.setTitleColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1), for: .normal)
            }
            else
            {
                expenseButton.setTitleColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1), for: .normal)
            }
        }
        else
        {
            print("enter the transaction type")
            selectedTransType=false
        }
        
        
    }
    
    @IBAction func finishPressed(_ sender: UIButton)
    {
        
        if selectedCat && selectedTransType && transactionAmount.text! != "" && transactionAmount.text!.isInt
        {
            account.addTransaction(transType: transType, cat: category.categoryIcons[catInd], amount: transactionAmount.text!)
            
            collectionCategory.reloadData()
            transactionTable.reloadData()
            delegate?.passAccountToHomeVC(accnt: account)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        else{
            alerts(cat: selectedCat, amount: transactionAmount.text!, transType: selectedTransType)
        }

        
        incomeButton.backgroundColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        expenseButton.backgroundColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        incomeButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        expenseButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        transactionAmount.text = nil
        selectedTransType = false
        transType = 0
        selectedCat = false

    }
    
    @IBAction func backToHomePressed(_ sender: UIButton) {
        let targetVC = navigationController?.viewControllers.first(where: {$0 is HomeViewController})
        if let destVC = targetVC {
           navigationController?.popToViewController(destVC, animated: true)
        }
    }
    
//MARK: - CollectionViewDelegateFunctions
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return category.categoryIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = account.catBackground[indexPath.row]
        
        if let icon = cell.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = account.catTint[indexPath.row]
        }
        if let iconLabel = cell.viewWithTag(200) as? UILabel{
            iconLabel.text = category.categoryIcons[indexPath.row]
            iconLabel.textColor = account.catTint[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath)
        
        account.iconColorState(state: "selected", ind: indexPath.row)
        cell!.backgroundColor = account.catBackground[indexPath.row]

        if let icon = cell!.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = account.catTint[indexPath.row]
        }
        if let iconLabel = cell?.viewWithTag(200) as? UILabel{
            iconLabel.textColor = account.catTint[indexPath.row]

        }

        account.iconColorState(state: "released", ind: indexPath.row)
        catInd = indexPath.row
        selectedCat = true
    }
    
//MARK: - TableViewDelegateFunctions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.transactionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction", for: indexPath)
        cell.textLabel!.text = account.displayTransaction(ind: indexPath.row)
        return cell
    }
    
    
}
