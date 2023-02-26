//
//  NewsListView.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 19/12/22.
//

import SwiftUI
import BetterSafariView

struct NewsListView: View {
    
    @ObservedObject var  newsmanager  : NewsDownloadManager
    @State private var showOnSafari = false
    @State private var selectedArticle : Article?
    
    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators: false) {
                ForEach(newsmanager.newsArticles){ article in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(article.title ?? "dadad")
                                .bold()
                                .foregroundColor(.white)
                                .fixedSize(horizontal : false  , vertical:  true)
                                Spacer()
                            AsyncImage.init(url: URL(string: (article.urlToImage?.replacingOccurrences( of: "http://", with: "https://")) ?? "https://i.pinimg.com/originals/7b/28/98/7b2898990ae6ce6d6b277113d51b14e8.png")! ) {
                                RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.2))
                                } image: { img in
                                    Image(uiImage: img)
                                        .resizable()
                                }
                                .scaledToFill()
                                .frame(width : 100 , height: 160)
                                .cornerRadius(10)
                            
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                            showOnSafari.toggle()
                        }
                        .sheet(isPresented: $showOnSafari  , content: {
                            //Load News
                            loadNews(for: selectedArticle ?? article)
                        })
                        RoundedRectangle(cornerRadius : 10).fill(Color.white.opacity(0.2))
                            .padding(.horizontal, 50)
                            .frame(height : 1)

                    }
                    
                }
            }
        }
      
    }
    private func loadNews(for article : Article) -> some View{
        return SafariView(url : URL(string: article.url!.replacingOccurrences(of: "http://", with: "https://"))!)
        
    }

}

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}
