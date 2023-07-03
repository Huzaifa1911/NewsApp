//
//  HomeScreen.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 23/05/2023.
//

import SwiftUI

struct HomeScreen: View {
     @StateObject private var newsViewModel = NewsVM()
     @State private var selectedCategory:NewsCategory=CategoryManager.categories[0]
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack(alignment:.leading,spacing: 20) {
                    CategoryRow(selectedCategory: $selectedCategory)
                        .padding(.leading,10)
                    
                    List (newsViewModel.news, id:\.id) { news in
                        NavigationLink(destination: NewsDetails(news: news)) {
                            NewsCard(news: news)
                        }
                    }
                    .navigationTitle("News")
                    .navigationBarTitleDisplayMode(.inline)
                    .listStyle(.plain)
                }
            }
            .onChange(of: selectedCategory, perform: { newValue in
                newsViewModel.getAllNewsByCategory(categoryName: selectedCategory.key)
            })
            Loader(isLoading: $newsViewModel.isLoading)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
