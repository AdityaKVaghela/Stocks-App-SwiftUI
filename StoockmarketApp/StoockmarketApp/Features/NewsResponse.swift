//
//  NewsResponse.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 19/12/22.
//

import Foundation

//struct NewsResponse : Codable {
//    var articles : [News]
//}


struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable , Identifiable {
    var id : UUID {return UUID()}
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    var urlToImage  : String?
//    var imageURL : String {
//            return urlToImage.replacingOccurrences( of: "http://", with: "https://")
//
//        }
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
