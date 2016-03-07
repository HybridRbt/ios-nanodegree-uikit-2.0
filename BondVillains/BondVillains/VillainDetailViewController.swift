//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jianfeng Yang on 3/7/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class VillainDetailViewController : UIViewController {
    
    @IBOutlet weak var villainLabel: UILabel!
    @IBOutlet weak var villainImage: UIImageView!
    
    var villain : Villain
    
    override func viewWillAppear(animated: Bool) {
        self.villainImage.image = UIImage(named: self.villain.imageName)
        self.villainLabel.text = self.villain.name
    }
}
