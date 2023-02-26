//
//  Manager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 09/12/22.
//

import Foundation

struct API {
    static var baseUrl : String {
        return "https://www.alphavantage.co/query?"
    }
    
    static func symbolSearchUrl(for seachKey :String) -> String {
        return urlBy(symbol: .search, seachKey: seachKey)
    }
    
    static func quoteUrl(for searchKey : String) -> String{
        return urlBy(symbol: .quote, seachKey: searchKey)
    }
    
    private static func urlBy(symbol : SymbolFunction, seachKey : String) -> String {
        switch symbol {
        case .search:
            return "\(baseUrl)function=\(symbol.rawValue)&apikey=\(key)&keywords=\(seachKey)"
        case .quote:
            return "\(baseUrl)function=\(symbol.rawValue)&apikey=\(key)&symbol=\(seachKey)"
        }
    }
    
    enum SymbolFunction : String {
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
    
}

extension API {
    static var key :String {
        return "N6OK46JY0ZQJ1SVN"
    }
    
}
