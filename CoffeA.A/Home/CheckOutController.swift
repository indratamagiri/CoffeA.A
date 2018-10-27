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
    var id: String?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var des: UILabel!
    
    @IBAction func addToCart(_ sender: Any) {
        indent();
        insertData();
        
        let alert = UIAlertController(title: "Order Add to Cart", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "backMenu", sender: self)
        }))
        self.present(alert, animated: true,completion: nil)
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
    
    func fetchData(idPrimary: String){
        var datas = [Product]();
        do {
            datas = try context.fetch(Product.fetchRequest());
            for load in datas {
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
        let iden = "Prt\(number)"
        //print(iden)
        fetchData(idPrimary: iden)
    }
    
    func insertData(){
        let product = Product(context: context)
            product.idUser = UserDefaults.standard.string(forKey: "defaultUser")
            product.date = Date() as NSDate;
            product.id = id;
            product.idUser =  UserDefaults.standard.string(forKey: "defaultUser");
            product.nameProduct = coffe?.nameCoffe;
            product.qty = 1;
            product.status = false;
            product.price = Double((coffe?.priceCoffe)!);
            print(product)
            appDelegate.saveContext()
    }
}
