//
//  Search.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 20/12/22.
//

import Foundation

struct Search : Codable , Identifiable {
    
    var id : UUID { return UUID() }
    var type : String
    var name : String
    var symbol : String
    var  region     : String
    var  marketOpen     : String
    var  marketClose     : String
    var  timezone     : String
    var  currency     : String
    var  matchScore     : String
    
    
    
    private enum CodingKeys: String , CodingKey {
        
        case  symbol = "1. symbol"
        case  name = "2. name"
        case  type = "3. type"
        case  region = "4. region"
        case  marketOpen = "5. marketOpen"
        case  marketClose = "6. marketClose"
        case  timezone = "7. timezone"
        case  currency = "8. currency"
        case  matchScore = "9. matchScore"
    }
    
}
