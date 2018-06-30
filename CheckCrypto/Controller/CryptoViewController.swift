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
    
    typealias JSONStandard = [String:AnyObject]
    
    var cryptosList = [CryptoModel]()
    
    var cryptoCurrency: CryptoModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //callAlamo(url: URL_API)
        
        getCryptoData(url: URL_API)
        
        getCryptoBitcoin(url: URL_BITCOIN)
        
    }    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as? CryptoCell {

           let crypto = cryptosList[indexPath.row]
           cell.configureCell(crypto: crypto)
            
            
             return cell;
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
func getCryptoData(url: String){
    
//    let cryptos = CryptoModel(name: "Litecoin", symbol: "LTC", rank: 6, price: 90)
//    self.cryptosList.append(cryptos)
    
    Alamofire.request(url, method: .get).responseJSON { (response) in
        if response.result.isSuccess {
            print("Sucess!")


            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let data = dict["data"] as? Dictionary<String,AnyObject>{
                    
                    if let bitcoin = data["1"] as? Dictionary<String, AnyObject>{
                        
                        let name = bitcoin["name"] as? String
                        
                        let symbol = bitcoin["symbol"] as? String
                        
                        let rank = bitcoin["rank"] as? Int
                        
                        if let quotes = bitcoin["quotes"] as? Dictionary<String, AnyObject>{
                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
                                if let price = USD["price"] as? Double {
                                   // print(price)
                                    
                                    let crypto = CryptoModel(name: name!, symbol: symbol!, rank: rank!, price: price)
                                     self.cryptosList.append(crypto)
                                }
                            }
                        }
                        
                    }
                    
                    if let litecoin = data["2"] as? Dictionary<String,AnyObject>{
                         let name = litecoin["name"] as? String
                        
                        let rank = litecoin["rank"] as? Int
                        
                        let symbol = litecoin["symbol"] as? String
                        
                        if let quotes = litecoin["quotes"] as? Dictionary<String, AnyObject>{
                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
                                if let price = USD["price"] as? Double {
                                    
                                    let crypto = CryptoModel(name: name!, symbol: symbol!, rank: rank!, price: price)
                                    self.cryptosList.append(crypto)
                                }
                            }
                        }
                        
                        
                    }
                    
                    if let stellar = data["512"] as? Dictionary<String, AnyObject>{
                         let name = stellar["name"] as? String
                        
                         let rank = stellar["rank"] as? Int
                        
                         let symbol = stellar["symbol"] as? String
                        
                        if let quotes = stellar["quotes"] as? Dictionary<String, AnyObject>{
                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
                                if let price = USD["price"] as? Double {
                                    let crypto = CryptoModel(name: name!, symbol: symbol!, rank: rank!, price: price)
                                    self.cryptosList.append(crypto)
                                }
                            }
                        }
                        
                    }
            }
        }
        }else {
                print("Error: \(String(describing: response.result.error))")
            }
        
           self.tableView.reloadData()
        
        }
    
    
}
    
    
    func getCryptoBitcoin(url: String) {
        Alamofire.request(URL_BITCOIN).responseJSON { (response) in
            if response.result.isSuccess {
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let data = dict["data"] as? Dictionary<String,AnyObject>{
                        
                        if let name = data["name"] as? String {
                             print(name)
                        }
                        
                        if let symbol = data["symbol"] as? String {
                            print(symbol)
                        }
                        
                        
                        if let rank = data["rank"] as? Int {
                            print(rank)
                        }
                        
                        if let totalSupply = data["total_supply"] as? Double {
                            print(totalSupply)
                        }
                        
                        if let maxSupply = data["max_supply"] as? Double {
                            print(maxSupply)
                        }
                        
                        if let quotes = data["quotes"] as? [Dictionary<String,AnyObject>], quotes.count > 0{
                            if let USD = quotes[0]["price"] as? Double {
                                print(USD)
                            }
                        }
             
                    }
                }
            }
        }
    }
}
