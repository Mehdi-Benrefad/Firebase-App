//
//  LoginViewController.swift
//  FirebaseApp
//
//  Created by Mehdi Benrefad on 10/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func login(_ sender: UIButton) {
        //recuperer les informations d'authetification
        guard
            let email = login.text,
            let password = password.text,
        email.count > 0,
        password.count > 0
            else{
                return
        }
        
        //Authentication
        //on cree un utilisateur avec l'email et le mot de passe qu'on q recupere
        Auth.auth().signIn(withEmail: email, password: password)
            { user, error in
                   if let error = error, user == nil {
                       let alert = UIAlertController(title: "Login in failed", message: error.localizedDescription, preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default))
                       self.present(alert, animated: true, completion: nil)
                   }else{
                       
                       Auth.auth().addStateDidChangeListener() {
                           auth ,user in
                           if user != nil {
                               self.performSegue(withIdentifier: "LoginToList", sender: nil)
                           }
                       }
                   }
               }
    }
    
    @IBAction func register(_ sender: UIButton) {
    }
    
    
}
