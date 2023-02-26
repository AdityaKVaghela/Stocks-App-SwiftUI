//
//  SeachView.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 20/12/22.
//

import SwiftUI

struct SeachView: View {
    @State private var searchTerm : String = ""
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
            VStack{
                HStack{
                    SearchTextView(searchTerm: $searchTerm)
                    Button {
                        searchManager.seachStocks(keyword: searchTerm)
                    } label: {
                        Image(systemName: "arrowtriangle.right.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
                ScrollView{
                    ForEach(searchManager.searches){ item in
                        HStack{
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .font(.title)
                                    .bold()
                                
                                Text(item.type)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                UserDefaultManager.shared.set(symbol: item.symbol)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
                            }.foregroundColor(.white)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(height : 1 )
                       
                    }
                }
                
                
            }      .padding(.top , 50)
                .padding(.horizontal , 16)
            
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}

struct SeachView_Previews: PreviewProvider {
    static var previews: some View {
        SeachView()
    }
}
