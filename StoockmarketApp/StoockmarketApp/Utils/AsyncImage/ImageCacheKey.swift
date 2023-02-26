//
//  ImageCacheKey.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 19/12/22.
//

import SwiftUI

struct ImageCacheKey : EnvironmentKey    {
    static let defaultValue : ImageCache = TemporaryImageCache()
}

extension EnvironmentValues{
    var imageCache : ImageCache {
        get {self[ImageCacheKey].self}
        set {self[ImageCacheKey].self = newValue}
    }
}
