//
//  AddViewController.swift
//  FirebaseApp
//
//  Created by Mehdi Benrefad on 10/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    //Image Picker
    let imagePicker = UIImagePickerController()
    
    let ref = Database.database().reference(withPath: "people")
    var items :[Person] = []
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var imgg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //definir le viewController en tant que delegate de l'image picker
        imagePicker.delegate = self
        //definir la source de l'image
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    @IBAction func addPerson(_ sender: UIButton) {
        let addPerson = Person(name: fname.text!, lname: lname.text!, age: age.text!)
        let addPersonRef = self.ref.childByAutoId()
        addPersonRef.setValue(addPerson.toAnyObject())
    }
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       //on verifie si l'utilisateur a selectionne une image correctement
        if let userPickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   imgg.image = userPickerImage
                  
       }
        imagePicker.dismiss(animated: true, completion: nil)
   }

    @IBAction func inageBTN(_ sender: Any) {
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker,animated: true,completion: nil)
    }
}
