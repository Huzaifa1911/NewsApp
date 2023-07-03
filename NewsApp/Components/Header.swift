//
//  Header.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 23/05/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Text("News App")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
        .frame(maxWidth:.infinity,maxHeight: 50)
        .background(Color.accentColor)
        
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
