//
//  LoginViewController.swift
//  NIBM_COVID19
//
//  Created by Isuru Prabhash on 9/17/20.
//  Copyright © 2020 Isuru Prabhash. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginAction(_ sender: Any) {
        
        let email = EmailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil
            {
                self.errorLbl.text = error!.localizedDescription
                self.errorLbl.alpha = 1
            }
            else
            {
                let navHome = self.storyboard?.instantiateViewController(identifier: Navigation.Storyboard.navController) as?
                NavController
                
                self.view.window?.rootViewController = navHome
                self.view.window?.makeKeyAndVisible()

                
            }
        }
        
    }
    
    /*func homeNavigation()
    {
        let navHome = storyboard?.instantiateViewController(identifier: Navigation.Storyboard.navController) as?
        NavController
        
        view.window?.rootViewController = navHome
        view.window?.makeKeyAndVisible()
    }*/
    

}
