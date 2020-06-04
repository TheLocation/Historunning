//
//  UserProfile_ViewController.swift
//  Historunning
//
//  Created by Matteo Postorino on 03/06/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit

class UserProfile_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonTest(_ sender: Any) {
        
        performSegue(withIdentifier: "goToRegion", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
