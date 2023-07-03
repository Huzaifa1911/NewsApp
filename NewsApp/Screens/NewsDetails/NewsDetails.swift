//
//  NewsDetails.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 23/05/2023.
//

import SwiftUI

struct NewsDetails: View {
    var news:News
    
    var body: some View {
        ScrollView {
            VStack (alignment:.leading) {
                
                OptionalView(news.title) { title in
                    Text(title)
                        .font(.title)
                }
                
                OptionalView(news.time){ time in
                    Text("Posted at \(time)")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                        .padding(.top,2)
                }
                
                OptionalView(news.imageUrl) { image_url in
                    AsyncImage(url: URL(string: image_url)){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.aspectRatio(contentMode: .fit)
                        .cornerRadius(11)
                        .frame(maxWidth:.infinity)
                }
                
                OptionalView(news.author) { author in
                    HStack (alignment:.center) {
                        Text(author)
                            .font(.title2)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.accentColor)
                    }
                }.padding(.top,20)
                
                OptionalView(news.content) {content in
                    Text(content)
                        .font(.body)
                }.padding(.top,1)
                
                Spacer()
                
            }.navigationTitle("News")
                .padding()
        }
    }
}

struct NewsDetails_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetails(news: NewsManager.news[0])
    }
}
