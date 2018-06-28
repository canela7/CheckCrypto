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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(crypto: CryptoModel){
        self.crypto = crypto
        
        cryptoNameLabel.text = self.crypto._name
        cryptoPriceLabel.text = "\(crypto._price)"
        
        
    }

}
