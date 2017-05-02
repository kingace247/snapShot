//
//  PictureViewController.swift
//  Snap shot
//
//  Created by David Garza on 5/1/17.
//  Copyright © 2017 David Garza. All rights reserved.
//

import UIKit
import Firebase

class PictureViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    
    }
    
    @IBAction func CameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func NextTapped(_ sender: Any) {
        
        NextButton.isEnabled = false
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
        
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").put(imageData!, metadata: nil, completion: {(metadata, error)in
            
            print("we tried to upload!")
            
            if error != nil {
                
                print("we had an error: \(error)")
                
            }else{
                
                print(metadata?.downloadURL())
                
                self.performSegue(withIdentifier: "selectUsersegue", sender: nil)
            
            }
        })

        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
              }
    }

