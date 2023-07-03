//
//  Loader.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 24/05/2023.
//

import SwiftUI

struct Loader: View {
    @Binding var isLoading:Bool
    
    var body: some View {
        if (isLoading){
            ZStack (alignment:.center) {
                Rectangle().edgesIgnoringSafeArea(.all)
                    .background(.bar)
                    .opacity(0.5)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                    .scaleEffect(1.5)
            }
        }
        
    }
}

//struct Loader_Previews: PreviewProvider {
//    static var previews: some View {
//        Loader()
//    }
//}
