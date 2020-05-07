//
//  ViewController.swift
//  Historunning
//
//  Created by Matteo Postorino on 11/01/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit
import RealmSwift

class Initial_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ToLoginButton(_ sender: UIButton, forEvent event: UIEvent)
    {
        self.performSegue(withIdentifier: "ToLogin", sender: self)
    }
    
    @IBAction func ToRegistrationButton(_ sender: Any, forEvent event: UIEvent) {
        
        self.performSegue(withIdentifier: "ToRegistration", sender: self)
    }
    
    
}

