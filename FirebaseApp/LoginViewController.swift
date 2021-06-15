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

        // On verifie si l'utilisateur exixte et on active le segue vers la liste.
        /*Auth.auth().addStateDidChangeListener() {
            auth ,user in
            if user != nil {
                self.performSegue(withIdentifier: "LoginToList", sender: nil)
            }
        }*/
        if Auth.auth().currentUser != nil {
                 self.performSegue(withIdentifier: "LoginToList", sender: nil)
               } else {
                 // No user is signed in.
                 // ...
               }
        //Dans la base de donnees firebase => Rules [".read":"auth!=null"] pour acceder au donnees un utilisateur doit etre authetifie
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
        //on cree une alerte
        let alert = UIAlertController(title: "Register", message: "Register", preferredStyle: .alert)
                //on ajoute un champ de login a l'alerte
               alert.addTextField { textEmail in
                    textEmail.placeholder = "Email"
                }
                //on ajoute un champs de mot de passe a l'alerte
               alert.addTextField { textPassword in
                   textPassword.isSecureTextEntry = true
                   textPassword.placeholder = "Password"
               }
                //on cree un bouton d'enregistrement avec une closure qui contient les traitements a ffectuer
               let saveAction =  UIAlertAction( title: "Save", style: .default  ) { _ in
                    //on recupere le premier champs de l'alerte
                   let emailField = alert.textFields![0]
                    //on recupere le deuxieme champs de l'alerte
                   let passwordField = alert.textFields![1]
                    //on cree un nouveu utilisateur
                   Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text! ) {
                        //si l creation est effectuee sans erreur on enregistre le nouveau utilisateur
                       user , error in
                       if error == nil {
                        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text! )
                            //si la creation est effectuee avec succes on active le segue vers la liste des personnes
                           Auth.auth().addStateDidChangeListener() {
                                            auth ,user in
                                            if user != nil {
                                               
                                                self.performSegue(withIdentifier: "LoginToList", sender: nil)
                                            }
                            }
                       }
                   }
               }
                //on ajoute le bouton d'enregistrement a l'alerte
                alert.addAction(saveAction)
                //oncree un bouton d'annulation
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel )
                //on ajoute le bouton d'annulation a l'alerte
               alert.addAction(cancelAction)
                //on afffiche l'alerte sous forme d'une popup a l'utilisateur
               present(alert, animated: true, completion: nil)
    }
    
    
}
