//
//  ChoosePlace_Cell.swift
//  Historunning
//
//  Created by Matteo Postorino on 21/05/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit

class ChooseRegion_Cell: UICollectionViewCell {
    
    @IBOutlet weak var regionView: UIImageView!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    var image:UIImage! {
        didSet{
            regionView.image = image
        }
    }
    
    var label:UILabel!{
        didSet{
            regionLabel.text = label.text
        }
    }
}
