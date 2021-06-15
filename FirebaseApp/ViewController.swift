//
//  ViewController.swift
//  FirebaseApp
//
//  Created by Mehdi Benrefad on 09/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    //on cree une reference vers la base de donnee
    let ref = Database.database().reference(withPath:"people")
    
    //on recupere nos objets
    var items : [Person] = []
    
    //idetifiant de la personne a modifier
    var personId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //on teste si l'utilisateur est authentifie
       // if Auth.auth().currentUser != nil {
       // } else {
         //   self.performSegue(withIdentifier: "backToLogin", sender: nil)
        //}
        
        // on recupere une copie des donnees dans la base de donnees via snapshot
            
            //on effectue un test sur la console pour tester si il ya une erreur
            ref.observe(.value, with: { snapshot in
                       print(snapshot.value as Any )
            })
            
            //on recuoere les personnes stoques dans la base de donnee
            ref.observe(.value, with: { snapshot in
                //c'est le tableau temporaie qu'on va remplir
                var newPerson: [Person] = []
                
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let persons = Person(snapshot: snapshot){
                            newPerson.append(persons)
                        }
                }
                
            //on affecte le resultat de la requette dans notre tableau
            self.items = newPerson
            self.tableView.reloadData()
            })
            
    }


    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell" , for: indexPath)
        
        let personforRow = items[indexPath.row]
        
        cell.textLabel?.text=personforRow.name + " " + personforRow.lname
        cell.detailTextLabel?.text=personforRow.age
        return cell
      }
    
    
    //supprimer une personne
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              let personItems = items[indexPath.row]
            
            //supprimer un objet de firebase a partir de sa reference
            personItems.ref?.removeValue()
          }
      }
      
    
    //Modifier une personne [preparation]
    //fonction qui se declanche des le clic sur une cellule
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //on recupere l'identifiant de la cellule selectionnee
        personId = items[indexPath.row].key
        //activer le segue qui a pour depart [ViewController] et destination [edit]
        performSegue(withIdentifier: "SegueToEdit", sender: nil)
    }
    
    //on passe l'identifiant au controlleur de modification
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToEdit"{
            let editViewController = segue.destination as! EditViewController
            editViewController.personId = personId
        }
    }
    
    @IBAction func LogOut(_ sender: UIBarButtonItem) {

           let firebaseAuth = Auth.auth()
           do {
             try firebaseAuth.signOut()
            //self.performSegue(withIdentifier: "toLoginSegue", sender: nil)
            self.dismiss(animated: true, completion: nil)
        
           } catch let signOutError as NSError {
             print ("Error signing out: %@", signOutError)
           }
    }
}

