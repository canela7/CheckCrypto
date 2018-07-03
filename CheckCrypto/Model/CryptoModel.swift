//
//  CryptoModel.swift
//  CheckCrypto
//
//  Created by Brian Canela on 6/27/18.
//  Copyright © 2018 Brian Canela. All rights reserved.
//

import Foundation
import Alamofire


class CryptoModel {
    
     private var _name: String?
     private var _cryptoId: Int?
    
     private var _symbol: String?
     private var _rank: Int?
     private var _price: Double?
     private var _totalsupply: Int?
     private var _maxsupply: Int?
    
    
    var _cryptoUrl: String!
    
    init(name: String, cryptoId: Int, symbol: String) {
        self._name = name
        self._cryptoId = cryptoId
        self._symbol = symbol
        
        _cryptoUrl = "\(URL_BASE)\(URL_CRYPTO)\(self.cryptoId)/"
    }
    
    
    init(name: String, symbol: String, rank: Int, price: Double) {
        self._name = name
        self._symbol = symbol
        self._rank = rank
        self._price = price
        
        _cryptoUrl = "\(URL_BASE)\(URL_CRYPTO)\(self.cryptoId)/"
        
    }

    
    
    
    init(name: String, cryptoId: Int, symbol: String, rank: Int, price: Double) {
        self._name = name
        self._cryptoId = cryptoId
        self._symbol = symbol
        self._rank = rank
        self._price = price
        
         _cryptoUrl = "\(URL_BASE)\(URL_CRYPTO)\(self.cryptoId)/"
    }
    
    var name: String {
        if _name == nil {
            _name = "N/A"
        }
        return _name!
    }
    
    var cryptoId: Int {
        return _cryptoId!
    }
    
    var symbol: String {
        if _symbol == nil {
            _symbol = "N/A"
        }
        return _symbol!
    }
    
    var rank: Int {
        if _rank == nil {
            _rank = 0
        }
        return _rank!
    }
    
    var price: Double {
        if _price == nil {
            _price = 0
        }
        return _price!
    }
    
    var totalsupply: Int {
        if _totalsupply == nil {
            _totalsupply = 0
        }
        return _totalsupply!
    }
    
    var maxsupply: Int {
        if _maxsupply == nil {
            _maxsupply = 0
        }
        return _maxsupply!
    }
    
    func getCryptoBitcoin(completed: @escaping DownloadComplete) {
        Alamofire.request(_cryptoUrl).responseJSON { (response) in
            if response.result.isSuccess {
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let data = dict["data"] as? Dictionary<String,AnyObject>{

                        if let id = data["id"] as? Int {
                            print(id)
                            self._cryptoId = id
                        }

                        if let name = data["name"] as? String {
                            print(name)
                            self._name = name
                        }

                        if let symbol = data["symbol"] as? String {
                            print(symbol)
                            self._symbol = symbol
                        }

                        if let rank = data["rank"] as? Int {
                            print(rank)
                            self._rank = rank
                        }

                        if let totalSupply = data["total_supply"] as? Double {
                            print(totalSupply)
                            self._totalsupply = Int(totalSupply)
                        }

                        if let maxSupply = data["max_supply"] as? Double {
                            print(maxSupply)
                            self._maxsupply = Int(maxSupply)
                        }

                        if let quotes = data["quotes"] as? [Dictionary<String,AnyObject>], quotes.count > 0{
                            if let USD = quotes[0]["price"] as? Double {
                                print(USD)
                                self._price = USD
                            }
                        }
                    }
                }
            }
             completed()
        }
    }
 
    
    
    
}
