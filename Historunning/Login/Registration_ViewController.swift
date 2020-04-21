//
//  Registration_ViewController.swift
//  Historunning
//
//  Created by Matteo Postorino on 05/04/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit
import RealmSwift
import PopupDialog

class Registration_ViewController: UIViewController {

    //Initializing realm db
    let realm = try! Realm()
    
    let User_reg = User()
    
    @IBOutlet weak var Reg_emailTextBox: UITextField!
    
    @IBOutlet weak var Reg_Password: UITextField!
    
    @IBOutlet weak var Reg_ConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func RegistrationToChoosePath_Button(_ sender: UIButton) {
  
        //MARK: 1. Control email textfield
        
        if(!isValidMail(Reg_emailTextBox.text!))
        {
           let popup_mail = generateRegPopup(reg_Title: "Wrong Email Format", reg_Message: "Please enter a valid mail", reg_Button_Title: "OK")

            self.present(popup_mail, animated: true, completion: nil)

        }
        
        //MARK: 2. Control password and confirm pw textfields
            
        else if (Reg_Password.text!.isEmpty || Reg_ConfirmPassword.text!.isEmpty){
            
            let popup_empty_pw = generateRegPopup(reg_Title: "Password field empty", reg_Message: "Please insert a valid password", reg_Button_Title: "OK")
             
             self.present(popup_empty_pw, animated: true, completion: nil)
        }
        
        //MARK: 3. Control password matchings and write in db
        else if(Reg_Password.text != Reg_ConfirmPassword.text)
        {
            //print("PASSWORD DO NOT MATCH!!!")
             
            let popup_pw = generateRegPopup(reg_Title: "Wrong Password", reg_Message: "Password Mismatch", reg_Button_Title: "OK")
             
             self.present(popup_pw, animated: true, completion: nil)
        }
        else
        {

            save(user: User_reg)
            
//MARK: present and performsegue not properly working together: check
            
//          let popup_ok = generateRegPopup(reg_Title: "Registration completed", reg_Message: "Get ready to run!", reg_Button_Title: "Run")
//
//          self.present(popup_ok, animated: true, completion: nil)
            
            self.performSegue(withIdentifier: "RegistrationToChoosePath", sender: self)

        }
    }
    
    //MARK: METHODS CALLED
    
    //Save user
    func save(user: User){
        
        do
        {
            try realm.write {
                user.UserName = Reg_emailTextBox.text!
                user.Password = Reg_Password.text!
                realm.add(user)
                print("User saved succesfully")
            }
        } catch {
            print("error saving message, \(error)")
        }
    }
    
    //Method checking if mail is valid
    
    func isValidMail(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    //Generate popup
    func generateRegPopup (reg_Title: String, reg_Message: String, reg_Button_Title: String) -> PopupDialog
    {
        let popup = PopupDialog(title: reg_Title, message: reg_Message)
        
        let OkButton = DefaultButton(title: reg_Button_Title, height: 60) {
            print("Again")
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
