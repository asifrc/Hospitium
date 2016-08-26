//
//  CameraViewController.swift
//  Hospitium 0.2
//
//  Created by Jocelyn R on 8/4/16.
//  Copyright © 2016 Peter R. Rose Jr. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
 
    @IBOutlet var imageView: UIImageView!
        
    @IBOutlet weak var camera: UIButton!
    
    @IBAction func takePhoto(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        picker.cameraDevice = .Front
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil)
        appDelegate.imageShare = imageView.image
    }
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let image = appDelegate.imageShare
        imageView.image = image
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        imageView.image = nil
    }
    

}

