//
//  ViewController.swift
//  Venture
//
//  Created by Pedro A. M. Scocco on 8/28/16.
//  Copyright © 2016 Pedro A. M. Scocco. All rights reserved.
//

import UIKit
import EPContactsPicker
import FontAwesome_swift
import Stripe

class ControlViewController: UIViewController, EPPickerDelegate, STPPaymentContextDelegate {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    var profile: EPContact!
    
    var paymentContext: STPPaymentContext!
    
    var newNavigationController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here, MyAPIAdapter is your class that implements STPBackendAPIAdapter (see above)
        self.paymentContext = STPPaymentContext()
        self.paymentContext.delegate = self
        self.paymentContext.hostViewController = self
        self.paymentContext.paymentAmount = 18000 // Measured in cents, i.e. $50 USD
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
        
        let rightBarButton = UIBarButtonItem(title: "", style: .Plain, target: self, action: #selector(cardTapped))
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
        rightBarButton.setTitleTextAttributes(attributes, forState: .Normal)
        rightBarButton.title = String.fontAwesomeIconWithCode("fa-credit-card")
        
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func cardTapped() {
        self.paymentContext.presentPaymentMethodsViewController()
        UIApplication.sharedApplication().openURL(NSURL.init(string: "https://m.me/ventureinvesting")!)
    }
    
    func paymentContextDidChange(paymentContext: STPPaymentContext) {
        
    }
    
    func paymentContext(paymentContext: STPPaymentContext, didFailToLoadWithError error: NSError) {
        
    }
    
    func paymentContext(paymentContext: STPPaymentContext, didFinishWithStatus status: STPPaymentStatus, error: NSError?) {
        
    }
    
    func paymentContext(paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: STPErrorBlock) {
        
    }
    
    @IBAction func selectContact(sender: AnyObject) {
        let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:false, subtitleCellType: SubtitleCellValue.PhoneNumber)
        self.newNavigationController = UINavigationController(rootViewController: contactPickerScene)
        self.presentViewController(self.newNavigationController, animated: true, completion: nil)
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectContact contact: EPContact) {
        self.profile = contact
        
        self.valueLabel.text = "R$ 200"
        
        self.performSegueWithIdentifier("newContact", sender: self)
        
        self.profileName.text = contact.firstName! as String
        self.profileImageView.image = contact.profileImage
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newContact" {
            let viewController = segue.destinationViewController as! NewContactViewController
            viewController.profile = self.profile
        }
    }
}

