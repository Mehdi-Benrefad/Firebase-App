//
//  EditViewController.swift
//  FirebaseApp
//
//  Created by Mehdi Benrefad on 10/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class EditViewController: UIViewController {
    
    //on recupere la reference de la base de donnee
    let ref = Database.database().reference(withPath: "people")
    
    //idetifiant de la personne a modifier
    var personId = ""
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref.child(personId).observeSingleEvent(of: .value, with: { (snapshot) in
            
            //on recupere la personne par l'id passe en parametres
            let personDict = snapshot.value as! [String: Any]
            
            //on stoque ces donnes (nom,prenom.age) dans des constantes
            let name = personDict["name"] as! String
            let lname = personDict["lname"] as! String
            let age = personDict["age"] as! String
            
            //on affiche les anciennes valeurs dans les inputs de l' EditViewController
            self.fname.text = name
            self.lname.text = lname
            self.age.text = age
         
          })
            //en cas d'erreur on affiche un message pour savoir son endroit [etape optionnelle]
            {
                (error) in
            print(error.localizedDescription)
            }
    }
    

    
    @IBAction func UpdatePerson(_ sender: UIButton) {
        let updatePerson = Person(name: fname.text!, lname: lname.text!, age: age.text!)
        
    ref.child(personId).updateChildValues(updatePerson.toAnyObject() as! [AnyHashable : Any])
    }
    
}
