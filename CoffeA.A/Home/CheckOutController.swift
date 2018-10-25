//
//  CheckOutController.swift
//  CoffeA.A
//
//  Created by giri on 25/10/18.
//  Copyright © 2018 giri. All rights reserved.
//

import UIKit

class CheckOutController: UIViewController {

    var coffe: Coffe?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var des: UILabel!
    
    @IBAction func addToCart(_ sender: Any) {
        
    }
    
    
    @IBAction func back(_ sender: Any) {
         self.performSegue(withIdentifier: "backMenu", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(coffe!)
        name.text = coffe?.nameCoffe;
        origin.text = coffe?.kindCoffe;
        des.text = coffe?.desCoffe;
        // Do any additional setup after loading the view.
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
