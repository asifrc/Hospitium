//
//  cameraScene.swift
//  Hospitium 0.2
//
//  Created by Loaner on 8/2/16.
//  Copyright © 2016 Peter R. Rose Jr. All rights reserved.
//

import Foundation
import UIKit

class cameraScene: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set button2 hidden at start
        continueButton.hidden = true
        imageDisplay.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        let targetStoryboard = UIStoryboard(name: "formScene", bundle: nil)
        let nextViewController = targetStoryboard.instantiateInitialViewController() as! formScene
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var defaultImage: UIImageView!
    
    @IBOutlet weak var tapSmileCameraButton: UIButton!
    @IBAction func tapSmileCameraButtonAction(sender: AnyObject) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func makeContinueVisibleAction(sender: AnyObject) {
        //Make button2 Visible
        continueButton.hidden = false
        imageDisplay.hidden = false
        
        //Set camera hidden at start
        tapSmileCameraButton.hidden = true
        defaultImage.hidden = true
    }
    //Here is the action when you press button1 which is visible
    

}