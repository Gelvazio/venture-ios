//
//  ViewController.swift
//  Venture
//
//  Created by Pedro A. M. Scocco on 8/28/16.
//  Copyright © 2016 Pedro A. M. Scocco. All rights reserved.
//

import UIKit
import EPContactsPicker

class NewContactViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePhone: UILabel!
    
    @IBOutlet weak var initialInvSlider: UISlider!
    @IBOutlet weak var initialInvLabel: UITextField!
    
    @IBOutlet weak var initialInvSlider2: UISlider!
    @IBOutlet weak var initialInvLabel2: UITextField!
    
    @IBOutlet weak var initialInvSlider3: UISlider!
    @IBOutlet weak var initialInvLabel3: UITextField!
    
    var profile: EPContact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
    }
    
    @IBAction func confirma(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        let first = self.profile.firstName! as String
        let last = self.profile.lastName! as String
        self.profileName.text = first + " " + last
        self.profileImageView.image = self.profile.profileImage
        if self.profile.phoneNumbers.count > 0 {
            self.profilePhone.text = self.profile.phoneNumbers[0].phoneNumber
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let value = round(20.0 + (sender.value * 180.0))
        self.initialInvLabel.text = "R$ \(value)"
    }
    
    @IBAction func sliderValueChanged2(sender: UISlider) {
        let value = round(20.0 + (sender.value * 180.0))
        self.initialInvLabel2.text = "R$ \(value)"
    }
    
    @IBAction func sliderValueChanged3(sender: UISlider) {
        let value = round(20.0 + (sender.value * 180.0))
        self.initialInvLabel3.text = "R$ \(value)"
    }
    
    @IBAction func initValueChanged(sender: UITextField) {
        if let string = sender.text {
            let index = string.startIndex.advancedBy(3)
            
            var value = Float(string.substringFromIndex(index))!
            
            if value > 220 {
                value = 220.0
            } else if value < 20 {
                value = 20.0
            }
            
            let percent = (value - 20) / 180.0
            
            self.initialInvSlider.value = percent
        }
    }
}

