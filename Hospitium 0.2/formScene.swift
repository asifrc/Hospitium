//
//  formScene.swift
//  Hospitium 0.2
//
//  Created by Loaner on 8/2/16.
//  Copyright © 2016 Peter R. Rose Jr. All rights reserved.
//

import Foundation
import UIKit

class formScene: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    // picker view for select role
    @IBOutlet weak var selectRole: UITextField!
    var roles = ["C-Level Executive","VP or Director","Project Manager","Product Manager","Manager - Other","Architect","Developer","Analyst","Tester","Consultant","Student","Other"]
    var picker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        firstNameTextField.tag = 0
        
        lastNameTextField.delegate = self
        lastNameTextField.tag = 1
        
        emailTextField.delegate = self
        emailTextField.tag = 2
        
        companyTextField.delegate = self
        companyTextField.tag = 3
        
        selectRole.delegate = self
        selectRole.tag = 4
        
        picker.delegate = self
        picker.dataSource = self
        selectRole.inputView = picker
        
    }
    
    // dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1;
        if let nextResponder: UIResponder! = textField.superview!.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    var noActiveField = Bool()
    var activeField = UITextField()
    
    func textFieldDidBeginEditing(textField: UITextField) {
        activeField = textField
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
        noActiveField = false
    }
    
    //picker view function
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roles.count
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRole.text = roles[row]
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roles[row]
    }

    @IBAction func doneButton(sender: UIButton) {
        selectRole.resignFirstResponder()
    }

   @IBAction func unwindToFormScene(segue: UIStoryboardSegue) {
        dispatch_async(dispatch_get_main_queue()) { [ weak self] in
            self?.firstNameTextField.text = nil
            self?.lastNameTextField.text = nil
            self?.emailTextField.text = nil
            self?.companyTextField.text = nil
            self?.selectRole.text = nil
        }
    }
    
    
    // @IBAction func continueButton(sender: UIButton) {
    //}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let firstNameShare = appDelegate.firstNameShare
        firstNameTextField.text = firstNameShare;
        let lastNameShare = appDelegate.lastNameShare
        lastNameTextField.text = lastNameShare;
        let companyShare = appDelegate.companyShare
        companyTextField.text = companyShare;
        let roleShare = appDelegate.roleShare
        selectRole.text = roleShare
    }
    
    override func viewWillDisappear(animated: Bool) {

        super.viewWillDisappear(animated)
        appDelegate.firstNameShare = firstNameTextField.text!;
        appDelegate.lastNameShare = lastNameTextField.text!;
        appDelegate.companyShare = companyTextField.text!;
        appDelegate.roleShare = selectRole.text!
    }
    
   

    // the things that we need to add is to store the database to marketo api
    // things such as name and email are very important to keep in the databasee
    // in order to make this happen
    // we need:
    // much more access to marketo and not only that but we need to know the power certain keys have
    // once we have that figured out we need to make sure that when a user turn a switch on that it sends a message to marketo and that will be one function
    // then we can make another function which allows the information that was input by the user to be saved by creating a new lead into the database
    
    
}
