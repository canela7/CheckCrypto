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
    
     private var _name: String!
     private var _cryptoId: Int!
    
     private var _symbol: String!
     private var _rank: Int!
     private var _price: Double!
     private var _totalsupply: Int!
     private var _maxsupply: Int!
    
    
    var _cryptoUrl: String!
    
    init(name: String, cryptoId: Int) {
        self._name = name
        self._cryptoId = cryptoId
        
        _cryptoUrl = "\(URL_BASE)\(URL_CRYPTO)\(self.cryptoId)"
    }
    
    init(name: String, symbol: String, rank: Int, price: Double) {
        self._name = name
        self._symbol = symbol
        self._rank = rank
        self._price = price
    }
    
    var name: String {
        if _name == nil {
            _name = "N/A"
        }
        return _name
    }
    
    var cryptoId: Int {
        return _cryptoId
    }
    
    var symbol: String {
        if _symbol == nil {
            _symbol = "N/A"
        }
        return _symbol
    }
    
    var rank: Int {
        if _rank == nil {
            _rank = 0
        }
        return _rank
    }
    
    var price: Double {
        if _price == nil {
            _price = 0
        }
        return _price
    }
    
    var totalsupply: Int {
        if _totalsupply == nil {
            _totalsupply = 0
        }
        return _totalsupply
    }
    
    var maxsupply: Int {
        if _maxsupply == nil {
            _maxsupply = 0
        }
        return _maxsupply
        
    }
    
    func downloadCryptoDetail(completed: DownloadComplete){
        Alamofire.request(URL_BITCOIN).responseJSON { (response) in
            if response.result.isSuccess {
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let data = dict["data"] as? Dictionary<String,AnyObject>{
                        
                        if let name = data["name"] as? String {
                            self._name = name
                        }
                        
                        if let symbol = data["symbol"] as? String {
                            self._symbol = symbol
                        }
                        
                        
                        if let rank = data["rank"] as? Int {
                            self._rank = rank
                        }
                        
                        if let totalSupply = data["total_supply"] as? Double {
                            self._totalsupply = Int(totalSupply)
                        }
                        
                        if let maxSupply = data["max_supply"] as? Double {
                            self._maxsupply = Int(maxSupply)
                        }
                        
                        if let quotes = data["quotes"] as? [Dictionary<String,AnyObject>], quotes.count > 0{
                            if let USD = quotes[0]["price"] as? Double {
                                self._price = USD
                                
                                print(self._price)
                            }
                        }
                        
                        print(self._name)
                        print(self._symbol)
                        print(self._rank)
                        print(self._totalsupply)
                        print(self._maxsupply)
                        
                    }
                }
            }
        }
    }
    
    
    
}
