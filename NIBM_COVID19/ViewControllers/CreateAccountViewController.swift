//
//  CreateAccountViewController.swift
//  NIBM_COVID19
//
//  Created by Isuru Prabhash on 9/17/20.
//  Copyright © 2020 Isuru Prabhash. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var FirstNameText: UITextField!
    
    @IBOutlet weak var LastNameText: UITextField!
    
    @IBOutlet weak var EmailText: UITextField!
    
    @IBOutlet weak var RoleText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    @IBOutlet weak var ErrorLabl: UILabel!
    
    
    
    	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
        func validateFields() -> String? {
            
            if FirstNameText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                LastNameText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                RoleText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                EmailText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                PasswordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                {
                    return "Fill all the requirements"
            }
        	
            return nil
        }
        
    // creating button function
        @IBAction func CreateAccountAction(_ sender: Any) {
            
            //Validations on fields
            let error = validateFields()
        	
            if error != nil
            {
                showError(error!)
            }
            else
            {
                let FirstName = FirstNameText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let LastName = LastNameText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let Role = RoleText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let Email = EmailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let Password = PasswordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
            
                    		
                //create user
                Auth.auth().createUser(withEmail: Email, password: Password) { (result, err) in
                    
                    if let err = err
                    {
                        self.showError("Error while creating User")
                    }
                    else
                    {
                        let db = Firestore.firestore()
                        
                        db.collection("users").addDocument(data: ["FirstName": FirstName, "LastName": LastName, "Role": Role,"uid": result!.user.uid]) { (error) in
                            <#code#>
                        }
                        
                    }
                }
            }
        }
    
    
    func showError(_ message:String){
        //display error
        ErrorLabl.text = message
        ErrorLabl.alpha = 1
    }

}
	
