//
//  Login_ViewController.swift
//  Historunning
//
//  Created by Matteo Postorino on 05/04/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit
import RealmSwift
import PopupDialog

class Login_ViewController: UIViewController {

    let realm = try! Realm()
    
    let User_login = User()
    
    @IBOutlet weak var Login_Mail: UITextField!
    
    @IBOutlet weak var Login_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginToChoosePath_Button(_ sender: UIButton) {
        
        let user_logged = retrieveUser(Username_data: Login_Mail.text!, Password_data: Login_Password.text!)
        
        if(user_logged.count == 1)
        {
            performSegue(withIdentifier: "LoginToUserProfile", sender: self)
            
//            let login_succesful = generatePopup(reg_Title: "Login Succesful", reg_Message: "Ready to run", reg_Button_Title: "Go")
//
//            self.present(login_succesful, animated: true, completion: nil)
        }
        else
        {
            let wrong_data = generatePopup(reg_Title: "Wrong data", reg_Message: "Please, insert correct e-mail or password", reg_Button_Title: "Ok")
                   
            self.present(wrong_data, animated: true, completion: nil)
            
            print("no")
        }
    
        
        //MARK: check results and give messages.
        
        
        
        //print(user_logged)
        
      //performSegue(withIdentifier: "LoginToChoosePath", sender: self)
    }
    
    func retrieveUser(Username_data: String, Password_data: String) -> Results<User> {
        
        let filter_user = Username_data
        let filter_pw = Password_data
        
        let predicate1:NSPredicate = NSPredicate(format: "UserName == %@", filter_user)
        let predicate2:NSPredicate = NSPredicate(format: "Password == %@", filter_pw)
        
        let predicate:NSPredicate  = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1,predicate2] )
              
        let user_found = realm.objects(User.self).filter(predicate)
        
        return user_found
    }
    
    func generatePopup (reg_Title: String, reg_Message: String, reg_Button_Title: String) -> PopupDialog
    {
        let popup = PopupDialog(title: reg_Title, message: reg_Message)
        
        let OkButton = DefaultButton(title: reg_Button_Title, height: 60) {
        }
        
        popup.addButton(OkButton)
        
        return popup
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
