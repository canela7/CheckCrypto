//
//  CryptoCell.swift
//  CheckCrypto
//
//  Created by Brian Canela on 6/27/18.
//  Copyright © 2018 Brian Canela. All rights reserved.
//

import UIKit

class CryptoCell: UITableViewCell {

    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    
    var crypto: CryptoModel!



    func configureCell(crypto: CryptoModel){
        self.crypto = crypto

        cryptoNameLabel.text = self.crypto.name
        cryptoPriceLabel.text = "\(String(describing: crypto.price))"
        
    }
    
    
    
    

}
