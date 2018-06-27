//
//  CryptoModel.swift
//  CheckCrypto
//
//  Created by Brian Canela on 6/27/18.
//  Copyright © 2018 Brian Canela. All rights reserved.
//

import Foundation


class CryptoModel {
    private var name: String!
    private var symbol: String!
    private var rank: Int!
    private var price: Double!
    
    var _name: String {
        if name == nil {
            name = ""
        }
        return name
    }
    
    
    var _symbol: String {
        if symbol == nil {
            symbol = ""
        }
        return symbol
    }
    
    
    var _rank: Int {
        if rank == nil {
            rank = 0
        }
       return rank
    }
    
    
    var _price: Double{
        return price
    }
    
    
    
    
    
}
