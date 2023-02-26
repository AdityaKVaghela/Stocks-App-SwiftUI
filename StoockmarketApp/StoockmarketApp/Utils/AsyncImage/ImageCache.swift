//
//  ImageCache.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 19/12/22.
//

import UIKit

protocol ImageCache {
    subscript(_ url : URL) ->  UIImage? { get set }
    
}
struct TemporaryImageCache : ImageCache {
    subscript(_ key: URL) -> UIImage? {
        get {
            cache.object(forKey: key as NSURL)
        }
        set {
            newValue ==  nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
    
    private let cache  : NSCache <NSURL , UIImage> = {
         let cache = NSCache<NSURL , UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    
    
}
