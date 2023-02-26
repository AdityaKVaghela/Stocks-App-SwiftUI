//
//  serchManager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 20/12/22.
//

import Foundation

final class SearchManager : ObservableObject {
    @Published var searches = [Search]() 
    
    func seachStocks(keyword: String){
        NetworkManager<SearchRResponse>().fetch(from: URL(string: API.symbolSearchUrl(for: keyword))!) { (result) in
            switch result {
            case .failure(let err):
                    print(err)
            case .success(let resp):
                DispatchQueue.main.async {
                    self.searches = resp.bestMatches
                }
            }
        }
    }
}
