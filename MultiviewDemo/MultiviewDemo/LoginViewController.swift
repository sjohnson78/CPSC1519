//
//  LoginViewController.swift
//  MultiviewDemo
//
//  Created by Sean Johnson on 2018-05-30.
//  Copyright © 2018 Sean Johnson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInUser(_ sender: Any) {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        present(homeVC, animated: true, completion: nil)
    }
    
    
    @IBAction func dismissNumberPad(_ sender: Any) {
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        //usernameTextField.resignFirstResponder() // this way is stupid
        // use the way below
        sender.resignFirstResponder()
    }
    
    // we need to create an "unwind" method, that we can use to go back from a child view to the parent
    // this is called an unwind segue, can google search that to find out how to do it
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue){
        // is is not necessary to write code here, but you might need to if you want to pass data from one view controller back to the other
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
