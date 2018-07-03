//
//  CryptoDataViewController.swift
//  CheckCrypto
//
//  Created by Brian Canela on 6/30/18.
//  Copyright © 2018 Brian Canela. All rights reserved.
//

import UIKit

class CryptoDataViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var currentSupplyLabel: UILabel!
    
    @IBOutlet weak var maxSupplyLabel: UILabel!
    
    var crypto: CryptoModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crypto.getCryptoBitcoin {
            print("Did arive here!")
            self.updateUI()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func updateUI() {
        priceLabel.text = "USD $: \(crypto.price)"
        rankLabel.text = "\(crypto.rank)"
        symbolLabel.text = crypto.symbol
        currentSupplyLabel.text = "\(crypto.totalsupply)"
        
        if crypto.maxsupply == 0 {
             maxSupplyLabel.text = "Unlimited"
        }else {
             maxSupplyLabel.text = "\(crypto.maxsupply)"
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
