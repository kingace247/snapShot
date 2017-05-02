//
//  SnapsViewController.swift
//  Snap shot
//
//  Created by David Garza on 5/1/17.
//  Copyright © 2017 David Garza. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func LogOutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("Logged Out")
    }
  
    
}
