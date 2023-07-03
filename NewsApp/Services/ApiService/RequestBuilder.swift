//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 18/05/2023.
//

import Foundation


class RequestBuilder {
//    Shared instance, implemented singleton pattern
    static let shared = RequestBuilder()
    
    private init () {  }
    
    public func buildGetRequest (with url:String, queryParams:[String:String]?=nil, completion:@escaping (Result<Data,Error>) -> Void) {
        var urlComponents=URLComponents(string: url)
        
        if let queryParams = queryParams, !queryParams.isEmpty {
            urlComponents?.queryItems = queryParams.map { (key: String, value: String) in
                URLQueryItem(name: key, value: value)
            }
        }
        
       
        
        guard let urlString=urlComponents?.url else {
            completion(.failure(NetworkError.INVALID_URL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlString){
            (data,_,error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.UNKNOWN))
            }
        }
        //        running the request
        task.resume()
    }
    
}
