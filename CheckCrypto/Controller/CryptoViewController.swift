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
        
        //getCryptoData(url: URL_API)
        
        getAllCryptoData(url: URL_CRYPTOS)
        
       // getCryptoBitcoin(url: URL_BITCOIN)
        
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
         performSegue(withIdentifier: "goToCryptoData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCryptoData"{
            if let destinationVC = segue.destination as? CryptoDataViewController {
                if let index = tableView.indexPathForSelectedRow {
                    destinationVC.crypto = cryptosList[index.row]
                }
            }
        }
    }
    
//func getCryptoData(url: String){
//    Alamofire.request(url, method: .get).responseJSON { (response) in
//        if response.result.isSuccess {
//            print("Sucess!")
//
//            if let dict = response.result.value as? Dictionary<String, AnyObject> {
//                if let data = dict["data"] as? Dictionary<String,AnyObject>{
//
//                    if let bitcoin = data["1"] as? Dictionary<String, AnyObject>{
//
//                        let id = bitcoin["id"] as? Int
//
//                        let name = bitcoin["name"] as? String
//
//                        let symbol = bitcoin["symbol"] as? String
//
//                        let rank = bitcoin["rank"] as? Int
//
//                        if let quotes = bitcoin["quotes"] as? Dictionary<String, AnyObject>{
//                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
//                                if let price = USD["price"] as? Double {
//                                   // print(price)
//
//                                    let crypto = CryptoModel(name: name!, cryptoId: id!, symbol: symbol!, rank: rank!, price: price)
//                                     self.cryptosList.append(crypto)
//                                }
//                            }
//                        }
//
//                    }
//
//                    if let litecoin = data["2"] as? Dictionary<String,AnyObject>{
//                         let name = litecoin["name"] as? String
//
//                        let id = litecoin["id"] as? Int
//
//                        let rank = litecoin["rank"] as? Int
//
//                        let symbol = litecoin["symbol"] as? String
//
//                        if let quotes = litecoin["quotes"] as? Dictionary<String, AnyObject>{
//                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
//                                if let price = USD["price"] as? Double {
//
//                                    let crypto = CryptoModel(name: name!, cryptoId: id!, symbol: symbol!, rank: rank!, price: price)
//                                    self.cryptosList.append(crypto)
//                                }
//                            }
//                        }
//                    }
//
//                    if let stellar = data["512"] as? Dictionary<String, AnyObject>{
//                         let name = stellar["name"] as? String
//
//                         let id = stellar["id"] as? Int
//
//
//                         let rank = stellar["rank"] as? Int
//
//                         let symbol = stellar["symbol"] as? String
//
//                        if let quotes = stellar["quotes"] as? Dictionary<String, AnyObject>{
//                            if let USD = quotes["USD"] as? Dictionary<String, AnyObject> {
//                                if let price = USD["price"] as? Double {
//
//                                    let crypto = CryptoModel(name: name!, cryptoId: id!, symbol: symbol!, rank: rank!, price: price)
//                                    self.cryptosList.append(crypto)
//                                }
//                            }
//                        }
//
//                    }
//            }
//        }
//        }else {
//                print("Error: \(String(describing: response.result.error))")
//            }
//
//           self.tableView.reloadData()
//
//        }
//
//
//}
    
    func getAllCryptoData(url: String){
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                print("Sucess!")
                print(response)
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    let dataCryptoDict = dict["data"] as! [Dictionary<String, AnyObject>]

                    for cryptos in dataCryptoDict {
                        let id = cryptos["id"] as? Int
                        let name = cryptos["name"] as? String
                        let symbol = cryptos["symbol"] as? String

                        let crypto = CryptoModel(name: name!, cryptoId: id!, symbol: symbol!)
                        self.cryptosList.append(crypto)
                    }


            }else {
                    print("Error: \(String(describing: response.result.error))")
                }

               self.tableView.reloadData()

            }
    }
}
    
    
    
    
}
