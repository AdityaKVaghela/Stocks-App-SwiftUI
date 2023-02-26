//
//  GlobalQuote.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 09/12/22.
//

import Foundation

struct GlobalQuoteResponse : Codable {
    var quote : Quote
    
    private enum CodingKeys : String , CodingKey {
        case quote = "Global Quote"
    }
}

