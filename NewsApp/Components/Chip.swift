//
//  Chip.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 23/05/2023.
//

import SwiftUI

struct Chip: View {
    var title:String
    var isSelected:Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium, design: .default))
            .foregroundColor(isSelected ? Color.accentColor : Color.black)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 11)
                    .stroke(isSelected ? Color.blue:Color.gray,lineWidth: 1)
            )
            .cornerRadius(11)
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(title: "Chip Label", isSelected: true)
    }
}
