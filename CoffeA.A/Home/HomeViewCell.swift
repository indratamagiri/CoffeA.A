//
//  HomeViewCell.swift
//  CoffeA.A
//
//  Created by giri on 25/10/18.
//  Copyright © 2018 giri. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
