//
//  BaseViewController.swift
//  HisabKitab
//
//  Created by Rabbia on 22/09/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func alerts(cat:Bool , amount:String, transType:Bool)  //Add Transaction
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

    func alerts(detail:String, amount:String) //Add Goal
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
    
    func alerts(cat:Bool , amount:String) //Create Budget
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
    
    

}
