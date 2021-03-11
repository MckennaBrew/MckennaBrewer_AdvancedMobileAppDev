//
//  TranslationData.swift
//  ShakespeareTranslator
//
//  Created by Mckenna Brewer on 3/7/21.
//

import Foundation

//struct Translation: Decodable {
//    let translated: String
//    let text: String
//}
//
//struct Check: Decodable{
//    let total: String
//}

struct TranslationData: Decodable {
    let success : totals
    let contents : translateddata
}
    
    struct totals: Decodable {
        let total: Int
    }
    
    struct translateddata : Decodable {
        let translated: String
        let text: String
    }
    
    //var success = [Check]()
    //var contents = [Translation]()

