//
//  NewsCard.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 21/05/2023.
//

import SwiftUI

struct NewsCard: View {
    var news:News
    
    var body: some View {
        HStack (alignment:.top){
            if let image_url = news.imageUrl{
                AsyncImage(url: URL(string: image_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 70)
                .cornerRadius(4)
            }
            VStack (alignment:.leading, spacing: 5) {
                if let title = news.title {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .lineLimit(1)
                }
                
                if let author = news.author {
                    Text(author)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
        }
        .frame(height:102)
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard(news: NewsManager.news[0])
    }
}
