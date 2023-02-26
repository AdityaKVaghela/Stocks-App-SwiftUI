//
//  QuoteManager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 09/12/22.
//

import Foundation

protocol QuotemanagerProtocol{
    var quotes : [Quote] {
        get set
    }
    func download(stocks: [String], completion : @escaping (Result<[Quote], NetworkError>) -> Void)
     
}
