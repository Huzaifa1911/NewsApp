//
//  NewsModel.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 12/05/2023.
//

import Foundation


struct News:Hashable,Codable {
    var author:String?
    var title:String?
    var content:String?
    var date:String?
    var time:String?
    var id:String?
    var imageUrl:String?
    var readMoreUrl:String?
    var url:String?
}
