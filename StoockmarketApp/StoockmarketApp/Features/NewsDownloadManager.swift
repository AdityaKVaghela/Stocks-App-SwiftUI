//
//  NewsDownloadManager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 19/12/22.
//

import Foundation
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=db0b6bb729ae46a0aae613837ddf7ceb

final class NewsDownloadManager : ObservableObject {
    @Published var newsArticles = [Article]()
    
    private let newsURlString =
"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=db0b6bb729ae46a0aae613837ddf7ceb"
     init() {
         print("asdasdafsafgsgdsfghdsg")
        download()
    }
    
    func download(){
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsURlString)!) { result in
            switch result{
            case .failure(let err) :
                print(err)
            case .success(let response) :
                DispatchQueue.main.async {
                    self.newsArticles = response.articles
                }
            }
        }
    }
}
