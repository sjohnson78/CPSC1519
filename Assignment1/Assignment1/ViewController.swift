//
//  ViewController.swift
//  Assignment1
//
//  Created by Sean Johnson on 2018-05-25.
//  Copyright © 2018 Sean Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var botLabel: UILabel!
    
    var conversionValue = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        conversionValue = 0.77
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  not needed, using number pad, removed for now
    
//    @IBAction func textFieldDoneEditing(sender: UITextField) {
//        sender.resignFirstResponder()
//    }
    
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        topTextField.resignFirstResponder()
    }
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        // code for the toggle controls here
        if sender.selectedSegmentIndex == 0 {  // CAD to USD is selected
            topLabel.text = "CAD"
            botLabel.text = "USD"
            conversionValue = 0.77
        } else {
            topLabel.text = "USD"
            botLabel.text = "CAD"
            conversionValue = 1.30
        }
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        // code for what happens when you touch convert button here
        if let topString = topTextField.text
            {
                if let amount = Double(topString){
                    
                    let finalAmount = amount * conversionValue
                    
                    let formatAmount = finalAmount as NSNumber
                    
                    let formatter = NumberFormatter()
                    formatter.usesGroupingSeparator = true
                    formatter.numberStyle = .currency
                    
                    // not necessary, and might cause issues if I add more currency types.
                    //currencyFormatter.locale = Locale.current
                    
                    let convertedFinalAmount = formatter.string(from: formatAmount)
                    
                    bottomTextField.text = "\(convertedFinalAmount!)"
                    
                }
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        // code for what happens when you touch reset button here
        topTextField.text = ""
        bottomTextField.text = ""
        
        let alert = UIAlertController(title: "ATTENTION", message: "Reset is complete :)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay...", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    
}

