//
//  LoginViewController.swift
//  Instaclone
//
//  Created by Jungyoon Yu on 3/21/17.
//  Copyright © 2017 Jungyoon Yu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(
            inBackground: usernameField.text!, password: passwordField.text!)
        { (user: PFUser?, error:Error?) in
            print("login")
            
            
            user?.password = self.passwordField.text!
            
            var bufferUser = User(userName: self.usernameField.text!, password: self.passwordField.text!)
            User.currentUser = bufferUser
            
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success
            {
                print("Created user")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print(error?.localizedDescription)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
