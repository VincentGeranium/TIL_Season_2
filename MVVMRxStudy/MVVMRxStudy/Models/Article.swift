//
//  Article.swift
//  MVVMRxStudy
//
//  Created by Minseong Kang on 2022/10/02.
//

import Foundation

struct ArticleList: Decodable {
	
	let articles: [Article]
	
}

struct Article: Decodable {
	let title: String?
	
	let description: String?
}
