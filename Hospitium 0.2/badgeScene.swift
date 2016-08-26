//
//  bagdeScene.swift
//  Hospitium 0.2
//
//  Created by Loaner on 8/2/16.
//  Copyright © 2016 Peter R. Rose Jr. All rights reserved.
//

import Foundation
import UIKit

class badgeScene: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var badge: UIView!
    @IBOutlet weak var printButton: UIButton!
    @IBAction func printPressed(sender: UIButton) {
        appDelegate.firstNameShare = ""
        appDelegate.lastNameShare = ""
        appDelegate.companyShare = ""
        appDelegate.roleShare = ""
        appDelegate.emailShare = ""
        appDelegate.imageShare = nil

        let navigationController = self.navigationController
        navigationController?.popToRootViewControllerAnimated(true)
        
//        if UIPrintInteractionController.isPrintingAvailable() {
//            let printInfo = UIPrintInfo(dictionary: nil)
//            printInfo.jobName = "User Badge"
//            printInfo.outputType = .General
//        
//            let printController = UIPrintInteractionController.sharedPrintController()
//            printController.printInfo = printInfo
//            printController.showsNumberOfCopies = false
//        
//            printController.printingItem = badge
//            printController.presentFromRect(<#T##rect: CGRect##CGRect#>, inView: <#T##UIView#>, animated: <#T##Bool#>, completionHandler: <#T##UIPrintInteractionCompletionHandler?##UIPrintInteractionCompletionHandler?##(UIPrintInteractionController, Bool, NSError?) -> Void#>)
//        }
//        
        // causes an error
        let image = imageView.image!
        let printInfo = UIPrintInfo.printInfo()
        
        printInfo.outputType = .Photo
        printInfo.jobName = "User Image"
        
        let printActivityItems: [AnyObject] = [
            printInfo,
            image
        ]
        
        let activityViewController = UIActivityViewController(activityItems: printActivityItems, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let firstNameShare = appDelegate.firstNameShare
        firstName.text = firstNameShare;
        let lastNameShare = appDelegate.lastNameShare
        lastName.text = lastNameShare;
        let companyShare = appDelegate.companyShare
        company.text = companyShare;
        let roleShare = appDelegate.roleShare
        role.text = roleShare;
        let imageShare = appDelegate.imageShare
        imageView.image = imageShare;
    }
    
}