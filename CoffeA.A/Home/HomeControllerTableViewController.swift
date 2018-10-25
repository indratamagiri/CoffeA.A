//
//  HomeControllerTableViewController.swift
//  CoffeA.A
//
//  Created by giri on 24/10/18.
//  Copyright © 2018 giri. All rights reserved.
//

import UIKit

class HomeControllerTableViewController: UITableViewController {

    
    var dataCoffe = [Coffe]();
    var coffe: Coffe?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(dataCoffe.count)
        return dataCoffe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeViewCell
        cell.name.text = dataCoffe[indexPath.row].nameCoffe;
        cell.price.text = String(dataCoffe[indexPath.row].priceCoffe);
        cell.img.image = UIImage(named:dataCoffe[indexPath.row].imgCoffe);

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coffe = dataCoffe[indexPath.row];
        self.performSegue(withIdentifier: "Detail", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let det = segue.destination as! CheckOutController
        det.coffe = coffe;
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func loadData() {
        dataCoffe = [Coffe(nameCoffe: "Kopi Premium Arabica Temanggung [100g]", imgCoffe: "", priceCoffe: 22500, kindCoffe: "Arabica", desCoffe: "kopi arabica. Dengan biji terbaik berkualitas tinggi. Dari lereng gunung area Temanggung, ketinggian 750 mdpl"), Coffe(nameCoffe: "Kopi Premium Arabica Temanggung [100g]", imgCoffe: "", priceCoffe: 22500, kindCoffe: "Arabica", desCoffe: "kopi arabica. Dengan biji terbaik berkualitas tinggi. Dari lereng gunung area Temanggung, ketinggian 750 mdpl"), Coffe(nameCoffe: "Kopi Premium Arabica Temanggung [100g]", imgCoffe: "", priceCoffe: 22500, kindCoffe: "Arabica", desCoffe: "kopi arabica. Dengan biji terbaik berkualitas tinggi. Dari lereng gunung area Temanggung, ketinggian 750 mdpl")]
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
}
