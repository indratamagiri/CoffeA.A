//
//  RegisController.swift
//  CoffeA.A
//
//  Created by giri on 24/10/18.
//  Copyright © 2018 giri. All rights reserved.
//

import UIKit

class RegisController: UIViewController {

    var users = [Users]();
    var email_unic="";
    var id = "";
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tlp: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: self);
    }
    
    @IBAction func register(_ sender: Any) {
        indent();
        
        var message = ""
        for user in users {
            email_unic = user.email!
            if email.text == email_unic {
                message = "Email has been used"
            }
        }
        if email.text == "" {
            message = "Input your email"
        }
        else if !validateEmail(enteredEmail: (email.text)!){
            message = "Please input correct email"
        }
        else if password.text == "" {
            message = "Input your password"
        }
        else if !(address.text?.hasSuffix("Street"))!{
            message = "Address must have Street"
        }else if tlp.text == ""{
            message = "Input your phone number"
        }//else if telp.text
        if message == ""{
            message = "Register success"
            let alert = UIAlertController(title: "Success", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                action in self.performSegue(withIdentifier: "login", sender: self)
            }))
            self.present(alert, animated: true, completion: nil)
            insertData();
        }else {
            let alert = UIAlertController(title: "Failed", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            tlp.becomeFirstResponder()
        }else if textField == tlp {
           password.resignFirstResponder()
        }else if textField == password {
            address.resignFirstResponder()
        }else if textField == address {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func fetchData(idPrimary: String) {
        do {
            users = try context.fetch(Users.fetchRequest());
            for load in users {
                if load.idUser == idPrimary {
                    indent();
                }
            }
            id = idPrimary;
        }catch {
        }
    }
    
    func indent(){
        let number = Int(arc4random_uniform(100000))
        let iden = "TSK\(number)"
        //print(iden)
        fetchData(idPrimary: iden)
    }
    
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func insertData(){
        let user = Users(context: context)
        
        user.idUser = id;
        user.email = email.text
        user.password = password.text
        user.address = address.text
        user.telp = tlp.text
        
        appDelegate.saveContext()
    }
  

}
