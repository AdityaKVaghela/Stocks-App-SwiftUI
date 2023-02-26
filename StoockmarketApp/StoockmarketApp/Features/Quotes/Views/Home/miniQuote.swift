//
//  miniQuote.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 16/12/22.
//

import SwiftUI

struct miniQuote: View {
    
    @ObservedObject var stockQuotes :  StockQuoteManager
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(stockQuotes.quotes){ quote in
                    VStack{
                        Text(quote.symbol)
                            .font(.subheadline)
                        
                        Text(quote.price)
                            .font(.subheadline)
                        
                        Text(quote.change)
                            .font(.subheadline)
                            .frame(width: 100)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                        
                    }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        .foregroundColor(.white)
                    
                }
            }
        }.onAppear() {
            stockQuotes.download(stocks: [], completion: { _ in})
        }
    }
}

struct miniQuote_Previews: PreviewProvider {
    static var previews: some View {
        miniQuote(stockQuotes: StockQuoteManager())
    }
}
