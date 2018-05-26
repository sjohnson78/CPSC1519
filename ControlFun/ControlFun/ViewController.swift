//
//  ViewController.swift
//  ControlFun
//
//  Created by Sean Johnson on 2018-05-22.
//  Copyright © 2018 Sean Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    

    override func viewDidLoad() {
        sliderLabel.text = "50"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        leftSwitch.isHidden = false
//        rightSwitch.isHidden = false
//        doSomethingButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"    }
    
    
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
        // setting both switches is jsut easier to set the value of both than it is to determine which switch made the cal and set only the other one. whichever switch called this method will already be at the correct value, setting it to the correct value again is all good.
    }
    
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {  // "Switches" is selected
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }

    }
    
    
    
//    @IBAction func toggleControls(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {  // "Switches" is selected
//            leftSwitch.isHidden = false
//            rightSwitch.isHidden = false
//            doSomethingButton.isHidden = true
//        } else {
//            leftSwitch.isHidden = true
//            rightSwitch.isHidden = true
//            doSomethingButton.isHidden = false
//        }
//    }
    
//    @IBAction func toggleControls(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {  // "Switches" is selected
//            leftSwitch.isHidden = false
//            rightSwitch.isHidden = false
//            doSomethingButton.isHidden = true
//        } else {
//            leftSwitch.isHidden = true
//            rightSwitch.isHidden = true
//            doSomethingButton.isHidden = false
//        }
//    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?",
                                           message:nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                                      style: .destructive, handler: { action in
                                        let msg = self.nameField.text!.isEmpty
                                            ? "You can breathe easy, everything went OK."
                                            : "You can breathe easy, \(self.nameField.text!)," // you need the "!" here after text or else there is a weird debug msg displayed to the user
                                            + " everything went OK."
                                        let controller2 = UIAlertController(
                                            title:"Something Was Done",
                                            message: msg, preferredStyle: .alert)
                                        let cancelAction = UIAlertAction(title: "Phew!",
                                                                         style: .cancel,
                                                                         handler: nil)
                                        controller2.addAction(cancelAction)
                                        self.present(controller2, animated: true,
                                                     completion: nil)
        })
                                        
        let noAction = UIAlertAction(title: "No way!",
                                     style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        present(controller, animated: true, completion: nil)
                                        
    }
    
    
}

