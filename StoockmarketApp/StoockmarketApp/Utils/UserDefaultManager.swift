//
//  UserDefaultManager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 20/12/22.
//

import Foundation

final class UserDefaultManager {
    private static let symbolKey = "SYMBOL_KEY"
     var savedSymbol = [String]()
    static let shared  = UserDefaultManager()
    
    private init(){
        get()
    }
    
    func get(){
        if let saved  = UserDefaults.standard.array(forKey: Self.symbolKey) as?  [String]
        {
            savedSymbol = saved
        }
    }
    func set(symbol : String){
        savedSymbol.append(symbol)
        UserDefaults.standard.set(self.savedSymbol , forKey: Self.symbolKey)
    }
}
