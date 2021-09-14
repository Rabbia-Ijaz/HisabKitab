//
//  AddTransactionViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 08/09/2021.
//

import UIKit
var transactionArray:[[String]] = []
var account = Account()
var budget = Budget()

class AddTransactionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    var catBackground:[UIColor] = [UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) , UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ]
    var catTint:[UIColor] = [UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) , UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ]
    var transTypeBGColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
    var transTypeTint = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var transactionAmount: UITextField!
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var transactionTable: UITableView!
    
    
    var selectedTransType = false
    var transType = 0
    var selectedCat = false
    var catInd:Int = 0
    
    var category = Category()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCategory.delegate=self
        collectionCategory.dataSource=self
        transactionTable.delegate=self
        transactionTable.dataSource=self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func transactionTypeSelected(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 2 {
            
            selectedTransType=true
            transType = sender.tag
            sender.layer.borderWidth = 1
            sender.layer.borderColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
            sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            if sender.tag == 1 {
                incomeButton.setTitleColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1), for: .normal)
            }
            else{
                expenseButton.setTitleColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1), for: .normal)
            }
        
                    
        }
        else {
            print("enter the transaction type")
            selectedTransType=false
        }
        
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        print(account.Balance)
        
        if selectedCat && selectedTransType && transactionAmount.text! != "" && transactionAmount.text!.isInt
        {
            if transType == 1 //income
            {
                transactionArray.append([category.categoryIcons[catInd],transactionAmount.text!])
                account.addIncome(income: Int(transactionAmount.text!)!)
                
            }
            else if transType == 2 //expense
            {
                transactionArray.append([category.categoryIcons[catInd],"-\(transactionAmount.text!)"])
                account.addExpense(expense: Int(transactionAmount.text!)!)
            }
            
        }
        
        else if transactionAmount.text!.isInt == false{
            let alert = UIAlertController(title: "Alert", message: "Add a number in Transaction Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        collectionCategory.reloadData()
        transactionTable.reloadData()
        incomeButton.backgroundColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        expenseButton.backgroundColor = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        incomeButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        expenseButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        transactionAmount.text = nil
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        print (transactionArray )
    }
    
    //MARK - CollectionViewDelegateFunctions
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return category.categoryIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = catBackground[indexPath.row]
        if let icon = cell.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = catTint[indexPath.row]
        }
        if let iconLabel = cell.viewWithTag(200) as? UILabel{
            iconLabel.text = category.categoryIcons[indexPath.row]
            iconLabel.textColor = catTint[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath)
        catBackground[indexPath.row] = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        catTint[indexPath.row] = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell!.backgroundColor = catBackground[indexPath.row]

        if let icon = cell!.viewWithTag(100) as? UIImageView{
            icon.image = UIImage.init(named: category.categoryIcons[indexPath.row])
            icon.tintColor = catTint[indexPath.row]
        }
        if let iconLabel = cell?.viewWithTag(200) as? UILabel{
            iconLabel.textColor = catTint[indexPath.row]

        }
        
        catBackground[indexPath.row] = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        catTint[indexPath.row] = #colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)
        catInd = indexPath.row
        selectedCat = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction", for: indexPath)
        cell.textLabel!.text = "\(transactionArray[indexPath.row][0]): \(transactionArray[indexPath.row][1])"
        return cell
    }
    
    
}
