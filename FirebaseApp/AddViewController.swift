//
//  AddViewController.swift
//  FirebaseApp
//
//  Created by Mehdi Benrefad on 10/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    let ref = Database.database().reference(withPath: "people")
    var items :[Person] = []
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var age: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPerson(_ sender: UIButton) {
        let addPerson = Person(name: fname.text!, lname: lname.text!, age: age.text!)
        let addPersonRef = self.ref.childByAutoId()
        addPersonRef.setValue(addPerson.toAnyObject())
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
