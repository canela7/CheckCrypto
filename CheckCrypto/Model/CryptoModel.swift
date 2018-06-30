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
     private var _symbol: String!
     private var _rank: Int!
     private var _price: Double!
    
    
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
    
    
    func downloadCryptoDetail(completed: DownloadComplete){
        Alamofire.request(URL_API).responseJSON { (response) in
            
        }
    }
    

 
    
    
    
}
