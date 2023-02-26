//
//  MockQuote.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 12/12/22.
//

import Foundation

final class MockQuoteManager : QuotemanagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
        
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote(symbol:  "AAPL", open: "135.90", high: "136.39", low: "133.77", price: "135.13", change:"-0.26", changePercent: "-0.19")
        let goog = Quote(symbol:  "GOOG", open: "2099.90", high: "2102.39", low: "2077.77", price: "2095.13", change:"0.51", changePercent: "0.054")
    
    for _ in 0..<8 {
        quotes.append(contentsOf: [aapl, goog])
    }
    }
}
