//
//  ViewController.swift
//  FITness
//
//
//

import UIKit

class Person {
    var name: String
    var age: Int
    var height: Int
    var weight: Int
    init(name: String, age: Int, height: Int, weight: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }
}

class ViewController: UIViewController {
    
    var lossSelected = false
    var gainSelected = false
    var maintainSelected = false
    
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var heightText: UITextField!
    
    @IBOutlet var ageText: UITextField!
    
    @IBOutlet var weightText: UITextField!
    
    @IBAction func lossButton(_ sender: Any) {
        if (lossSelected == true) {
            lossLabel.isHidden = true
            lossSelected = false
        }
        else if (gainSelected == true || maintainSelected == true) {
            gainLabel.isHidden = true
            gainSelected = false
            maintainLabel.isHidden = true
            maintainSelected = false
            lossLabel.isHidden = false
            lossSelected = true
        } else {
            lossLabel.isHidden = false
            lossSelected = true
        }
    }
    
    @IBAction func gainButton(_ sender: Any) {
        if (gainSelected == true) {
            gainLabel.isHidden = true
            gainSelected = false
        }
        else if (lossSelected == true || maintainSelected == true) {
            lossLabel.isHidden = true
            lossSelected = false
            maintainLabel.isHidden = true
            maintainSelected = false
            gainLabel.isHidden = false
            gainSelected = true
        } else {
            gainLabel.isHidden = false
            gainSelected = true
        }
    }
    
    @IBAction func maintainButton(_ sender: Any) {
        if (maintainSelected == true) {
            maintainLabel.isHidden = true
            maintainSelected = false
        }
        else if (lossSelected == true || gainSelected == true) {
            lossLabel.isHidden = true
            lossSelected = false
            gainLabel.isHidden = true
            gainSelected = false
            maintainLabel.isHidden = false
            maintainSelected = true
        } else {
            maintainLabel.isHidden = false
            maintainSelected = true
        }
    }
    
    @IBOutlet var lossLabel: UILabel!
    
    @IBOutlet var gainLabel: UILabel!
    
    @IBOutlet var maintainLabel: UILabel!
    
    @IBAction func beginButton(_ sender: Any) {
        let ageString = ageText.text!
        let heightString = heightText.text!
        let weightString = weightText.text!
        let nameString = nameText.text!
        let user = Person(name: nameString, age: Int(ageString)!, height: Int(heightString)!, weight: Int(weightString)!)
        
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        weightText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lossLabel.isHidden = true
        gainLabel.isHidden = true
        maintainLabel.isHidden = true
    }


}

