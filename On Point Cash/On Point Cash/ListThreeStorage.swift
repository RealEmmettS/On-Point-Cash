//
//  ListThreeStorage.swift
//  On Point Cash
//
//  Created by Emmett Shaughnessy on 11/7/18.
//  Copyright © 2018 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class ListThreeStorage: UIViewController {
    var startingMoneyCountThree = UserDefaults.standard.value(forKey: "TM3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if startingMoneyCountThree == nil{
            money.text = "$0"
        } else {
            money.text = "$\(startingMoneyCountThree!)"
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
        
        if startingMoneyCountThree == nil{
            totalMoneyThree = 0-newWithdraw
        }else if startingMoneyCountThree != nil{
            currentMoneyThree = startingMoneyCountThree as! Double
            totalMoneyThree = currentMoneyThree-newWithdraw
        }
        
        money.text = "$\(totalMoneyThree)"
        currentMoneyThree = currentMoneyThree-newWithdraw
        
        let storedMoney = Double(totalMoneyThree)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM3")
        startingMoneyCountThree = UserDefaults.standard.value(forKey: "TM3")
    }
    
    
    
    @IBAction func depositPressed(_ sender: Any) {
        if depositText.text == ""{
            newDeposit = Double(0)
        } else{
            newDeposit = Double(depositText.text!)!
        }
        
        if startingMoneyCountThree == nil{
            totalMoneyThree = 0+newDeposit
        }else if startingMoneyCountThree != nil{
            currentMoneyThree = startingMoneyCountThree as! Double
            totalMoneyThree = currentMoneyThree+newDeposit
        }
        
        money.text = "$\(totalMoneyThree)"
        currentMoneyThree = currentMoneyThree+newDeposit
        
        let storedMoney = Double(totalMoneyThree)
        
        UserDefaults.standard.set(storedMoney, forKey: "TM3")
        startingMoneyCountThree = UserDefaults.standard.value(forKey: "TM3")
    }
    
    @IBAction func clearMoney(_ sender: Any) {
        totalMoneyThree = Double(0)
        currentMoneyThree = Double(0)
        money.text = "$0"
        
        withdrawText.text = ""
        depositText.text = ""
        
        let defaultNumber = Double(0)
        UserDefaults.standard.set(defaultNumber, forKey: "TM33")
    }
    

}
