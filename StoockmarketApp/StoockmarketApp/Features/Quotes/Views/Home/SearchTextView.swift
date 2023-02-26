//
//  SearchTextView.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 15/12/22.
//

import SwiftUI

struct SearchTextView: View {
    
    @Binding var searchTerm : String
    
    var body: some View {
        CustomTextField(placeHolder: Text("Search").foregroundColor(Color.gray), text: $searchTerm)
            .foregroundColor(.white)
            .padding(.leading, 40)
            .frame(height : 30)
            .background(ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.6))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10)
            })
        
    }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(searchTerm: .constant(""))
    }
}
