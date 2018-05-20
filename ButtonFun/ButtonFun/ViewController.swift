//
//  ViewController.swift
//  ButtonFun
//
//  Created by Sean Johnson on 2018-05-19.
//  Copyright © 2018 Sean Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // this first line sets a (constant) variable named title to equal the title (which we set as left, for example) of the sender (the linked object that activated this action).
        let title = sender.title(for: .selected)!
        
        // this second line creates a new string, using string interpolation, adding the title from the line above in front of the text button pressed
        let text = "\(title) button pressed"
        
        // this third line assigns the string we created in the second line to the label's text property, allowing it to appear on the storyboard, we commented this out to show a more advanced technique
        //statusLabel.text = text
        
        
        // this line creates a string named styledText, the difference here is that it's an NSMutableAttributedString instance, which means a string that is able to have its attributes changed.
        let styledText = NSMutableAttributedString(string: text)
        
        // this line creates a dictionary named attributes. we use this to store the attributes that we want to apply to the string created above.
        let attributes = [
            NSAttributedStringKey.font:
                UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attributes, range: nameRange)
        statusLabel.attributedText = styledText
    }
}


