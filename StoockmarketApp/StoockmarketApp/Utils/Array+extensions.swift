//
//  Array+extensions.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 20/12/22.
//

import Foundation

extension Array where Element : Hashable{
    func diffence(from other : [Element]) -> [Element]{
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
