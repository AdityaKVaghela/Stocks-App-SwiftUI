//
//  QuoteCell.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 15/12/22.
//

import SwiftUI

struct QuoteCell: View {
    var  quote : Quote
    
    var body: some View {
        HStack{
            Text(quote.symbol)
                .font(.body)
                .bold()
            Spacer()
            
            Spacer()
            
            VStack{
                Text(quote.price)
                    .bold()
                Text(quote.change)
                    .padding([.horizontal])
                    .frame(width:100)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red) , alignment: .trailing )
            }
        }.padding()
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(symbol: "APPL", open: "135.22", high: "140.22", low: "130", price: "135.12", change: "-0.12", changePercent: "-0.98%"))
    }
}
