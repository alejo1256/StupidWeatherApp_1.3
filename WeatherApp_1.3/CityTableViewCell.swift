//
//  CityTableViewCell.swift
//  WeatherApp_1.3
//
//  Created by Alejandro Gonzalez on 6/9/18.
//  Copyright © 2018 Alejandro Gonzalez. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!

    @IBOutlet var temperatureLabel: UILabel! 
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
