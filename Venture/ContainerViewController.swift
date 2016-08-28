//
//  ContainerViewController.swift
//  Venture
//
//  Created by Pedro A. M. Scocco on 8/28/16.
//  Copyright © 2016 Pedro A. M. Scocco. All rights reserved.
//

import SlideMenuControllerSwift

class ContainerViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    
}
