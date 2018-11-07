//
//  ViewController.swift
//  On Point Cash
//
//  Created by Emmett Shaughnessy on 10/27/18.
//  Copyright © 2018 Emmett Shaughnessy. All rights reserved.
//

import UIKit
var currentMoney = Double(0)
var totalMoney = Double(0)


class ViewController: UIViewController {

    var startingMoneyCount = UserDefaults.standard.value(forKey: "TM")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if startingMoneyCount == nil{
            money.text = "$0"
        } else {
            money.text = "$\(startingMoneyCount!)"
        }
    }
    
    
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var withdrawText: UITextField!
    @IBOutlet weak var depositText: UITextField!
    
    var newWithdraw = Double(0)
    var newDeposit = Double(0)
    
    
    @IBAction func withdrawPressed(_ sender: Any) {
        if withdrawText.text == ""{
            newWithdraw = Double(0)
        } else{
            newWithdraw = Double(withdrawText.text!)!
        }
        
        if startingMoneyCount == nil{
            totalMoney = 0-newWithdraw
        }else if startingMoneyCount != nil{
            currentMoney = startingMoneyCount as! Double
            totalMoney = currentMoney-newWithdraw
        }
        
        money.text = "$\(totalMoney)"
        currentMoney = currentMoney-newWithdraw
        
        let storedMoney = Double(totalMoney)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM")
        startingMoneyCount = UserDefaults.standard.value(forKey: "TM")
    }
    
    
    
    @IBAction func depositPressed(_ sender: Any) {
        if depositText.text == ""{
            newDeposit = Double(0)
        } else{
            newDeposit = Double(depositText.text!)!
        }
        
        if startingMoneyCount == nil{
            totalMoney = 0+newDeposit
        }else if startingMoneyCount != nil{
            currentMoney = startingMoneyCount as! Double
            totalMoney = currentMoney+newDeposit
        }
        
        money.text = "$\(totalMoney)"
        currentMoney = currentMoney+newDeposit
        
        let storedMoney = Double(totalMoney)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM")
        startingMoneyCount = UserDefaults.standard.value(forKey: "TM")
    }
    
    @IBAction func clearMoney(_ sender: Any) {
        totalMoney = Double(0)
        currentMoney = Double(0)
        money.text = "$0"
        let defaultNumber = Double(0)
        UserDefaults.standard.set(defaultNumber, forKey: "TM")
    }
    
    
}

