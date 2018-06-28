//
//  CryptoViewController.swift
//  CheckCrypto
//
//  Created by Brian Canela on 6/27/18.
//  Copyright © 2018 Brian Canela. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class CryptoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cryptos = [CryptoModel]()
    
    var URL_API = "https://api.coinmarketcap.com/v2/ticker/?limit=10"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getCryptoData(url: URL_API)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as? CryptoCell {
            
            cell.cryptoNameLabel.text = "Neck"
            cell.cryptoPriceLabel.text = "\(2093)"
            
            
             return cell;
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    //
    //    //MARK: - Networking
    //    /***************************************************************/
    
//    func getCryptoData(url: String) {
//
//        Alamofire.request(url, method: .get)
//            .responseJSON { response in
//                if response.result.isSuccess {
//
//                    print("Sucess! Got the Bitcoin Data")
//                    let bitcoinJSON : JSON = JSON(response.result.value!)
//
//                    self.updateBitcoinData(json: bitcoinJSON)
//
//                } else {
//                    print("Error: \(String(describing: response.result.error))")
//                    self.bitcoinPriceLabel.text = "Connection Issues"
//                }
//        }
//
//    }

    
    func getCryptoData(url: String){
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                
                print("Sucess!")
                let cryptoJSON : JSON = JSON(response.result.value!)
                print(cryptoJSON)
                
            }else {
                print("Error: \(String(describing: response.result.error))")
                
                
            }
        }
    }
    
    
}
