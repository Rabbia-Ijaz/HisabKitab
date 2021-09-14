//
//  CreateBudgetViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 09/09/2021.
//

import UIKit
var budgetArray:[[String]] = []


class CreateBudgetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var catBackground:[UIColor] = [UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) , UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ,UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ]
    var catTint:[UIColor] = [UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) , UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ,UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)),UIColor(#colorLiteral(red: 0, green: 0.4781872034, blue: 0.482606113, alpha: 1)) ]
    
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var budgetTable: UITableView!
    @IBOutlet weak var budgetTextField: UITextField!
    
    var selectedCat = false
    var catInd:Int = 0
    //var account = Account()
    var category = Category()
    var budget = Budget()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCategory.delegate=self
        collectionCategory.dataSource=self
        budgetTable.delegate=self
        budgetTable.dataSource=self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func finishPressed(_ sender: UIButton) {
        if selectedCat && budgetTextField.text != nil {
            
            let arrCount = budgetArray.count
            
            var catExist:Bool = false
            var i = 0
            while i<arrCount {
                
                if budgetArray[i][0] == category.categoryIcons[catInd]
                {
                    catExist = true
                    let temp: Int = Int(budgetArray[i][1])! + Int(budgetTextField.text!)!
                    budgetArray[i][1] = String(temp)
                }
                i+=1
            }
            if catExist == false {
                budgetArray.append([category.categoryIcons[catInd] , budgetTextField.text!])
            }
            
            budget.createBudget(catIndex: catInd, catAmount: Int(budgetTextField.text!)!)
            budgetTable.reloadData()
            collectionCategory.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

        }
        
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
        return budgetArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath)
        

        cell.textLabel!.text = "\(budgetArray[indexPath.row][0]): \(budgetArray[indexPath.row][1])"
        
        return cell
    }
}
