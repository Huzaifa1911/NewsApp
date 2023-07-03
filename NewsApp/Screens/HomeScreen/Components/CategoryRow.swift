//
//  CategoryRow.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 23/05/2023.
//

import SwiftUI

struct CategoryRow: View {
    @Binding var selectedCategory:NewsCategory
    
    var body: some View {
        VStack {
            ScrollView (.horizontal,showsIndicators: false) {
                HStack (alignment:.top,spacing: 0) {
                    ForEach(CategoryManager.categories) { category in
                        Chip(title: category.name, isSelected: selectedCategory.name==category.name)
                            .onTapGesture {
                                selectedCategory=category
                            }
                        Spacer()
                    }
                    
                }.onTapGesture {
                    
                }
            }
        }
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow()
//    }
//}
