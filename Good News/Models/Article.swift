//
//  Article.swift
//  Good News
//
//  Created by Jaouher Bejaoui  on 9/7/2021.
//

import Foundation

struct ArticlesList :Decodable {
    let articles: [Article]
}

extension ArticlesList{
    static var all : Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3e6043b17c8f4a75b9293ba3dc7708da")!
        return Resource<ArticlesList>(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description : String?
}

