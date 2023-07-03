//
//  NewsVM.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 12/05/2023.
//

import Foundation
import SwiftUI

struct Response:Codable {
    let category:String?
    let data:[News]?
}


class NewsVM : ObservableObject {
    @Published var news:[News] = []
    @Published var isLoading:Bool=false
    
    private let BASE_URL="https://inshorts.deta.dev/news"
    
    init () { self.getAllNewsByCategory(categoryName: "all") }
    
    func getAllNewsByCategory(categoryName:String) {
        self.isLoading=true
        RequestBuilder.shared.buildGetRequest(with: BASE_URL,queryParams: ["category" :categoryName]) { [weak self] result in
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async() {
                        if let news=response.data {
                            self?.news=news
                        }
                        self?.isLoading=false
                    }
                } catch {
                    print(error)
                }
            }
        }
        
    }
}


class NewsManager {
    static let news:[News]=[
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
        News(author: "Sumedha Sehra",title:"Nigerian weightlifter in dope net, India may gain", content: "India may move up after Nigerian weightlifter Chika Amalaha’s A dope sample returned positive. Santoshi Matsa’s bronze and Swati Singh's 4th position may be upgraded in women’s 53kg. “We shouldn’t presume anything just yet, once she has provided a B sample that is when we can decide on the re—awarding of medals and appropriate actions\" said CWG-Federation chief-executive Mike Hooper.", date: "29 Jul 2014,Tuesday", time: "06:47 pm", id: "07dedfe442fb4f5585bc297689e5695", imageUrl: "https://assets.inshorts.com/app_assets/images/2014/7jul/29/20035000-0013-0007-1695-000012345678-14708645681430.jpg?resize=*:400px", readMoreUrl: "http://www.thehindu.com/sport/other-sports/cwg-2014-nigerian-weightlifting-winner-chika-amalaha-fails-doping-test/article6260810.ece ", url: "https://www.inshorts.com/en/news/nigerian-weightlifter-in-dope-net-india-may-gain"),
    ]
}
