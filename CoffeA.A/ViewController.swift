//
//  ViewController.swift
//  CoffeA.A
//
//  Created by giri on 24/10/18.
//  Copyright © 2018 giri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var users = [Users]();
    var id = "";
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        if validate() {
            let defaultUser = UserDefaults.standard
            defaultUser.set(id, forKey: "defaultUser")
            performSegue(withIdentifier: "Home", sender: self)
        }else {
            let alert = UIAlertController(title: "Login Failed", message: "Incorrect password and email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchData() {
        do {
            users = try context.fetch(Users.fetchRequest())
        }catch {
            
        }
    }
    
    func validate() -> Bool {
        fetchData();
        for data in users {
            if email.text == data.email && password.text == data.password{
                id = data.idUser!;
                return true
            }
        }
        return false
    }
    
}

