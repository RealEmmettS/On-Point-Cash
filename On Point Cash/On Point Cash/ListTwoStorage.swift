//
//  ListTwoStorage.swift
//  On Point Cash
//
//  Created by Emmett Shaughnessy on 11/7/18.
//  Copyright © 2018 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class ListTwoStorage: UIViewController {
    var startingMoneyCountTwo = UserDefaults.standard.value(forKey: "TM2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if startingMoneyCountTwo == nil{
            money.text = "$0"
        } else {
            money.text = "$\(startingMoneyCountTwo!)"
        }
    }
    
    
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var withdrawText: UITextField!
    @IBOutlet weak var depositText: UITextField!
    @IBOutlet weak var listNumber: UILabel!
    
    
    
    var newWithdraw = Double(0)
    var newDeposit = Double(0)
    
    
    @IBAction func withdrawPressed(_ sender: Any) {
        if withdrawText.text == ""{
            newWithdraw = Double(0)
        } else{
            newWithdraw = Double(withdrawText.text!)!
        }
        
        if startingMoneyCountTwo == nil{
            totalMoneyTwo = 0-newWithdraw
        }else if startingMoneyCountTwo != nil{
            currentMoneyTwo = startingMoneyCountTwo as! Double
            totalMoneyTwo = currentMoneyTwo-newWithdraw
        }
        
        money.text = "$\(totalMoneyTwo)"
        currentMoneyTwo = currentMoneyTwo-newWithdraw
        
        let storedMoney = Double(totalMoneyTwo)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM2")
        startingMoneyCountTwo = UserDefaults.standard.value(forKey: "TM2")
    }
    
    
    
    @IBAction func depositPressed(_ sender: Any) {
        if depositText.text == ""{
            newDeposit = Double(0)
        } else{
            newDeposit = Double(depositText.text!)!
        }
        
        if startingMoneyCountTwo == nil{
            totalMoneyTwo = 0+newDeposit
        }else if startingMoneyCountTwo != nil{
            currentMoneyTwo = startingMoneyCountTwo as! Double
            totalMoneyTwo = currentMoneyTwo+newDeposit
        }
        
        money.text = "$\(totalMoneyTwo)"
        currentMoneyTwo = currentMoneyTwo+newDeposit
        
        let storedMoney = Double(totalMoneyTwo)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM2")
        startingMoneyCountTwo = UserDefaults.standard.value(forKey: "TM2")
    }
    
    @IBAction func clearMoney(_ sender: Any) {
        totalMoneyTwo = Double(0)
        currentMoneyTwo = Double(0)
        money.text = "$0"
        
        withdrawText.text = ""
        depositText.text = ""
        
        let defaultNumber = Double(0)
        UserDefaults.standard.set(defaultNumber, forKey: "TM2")
    }
    
    
}
