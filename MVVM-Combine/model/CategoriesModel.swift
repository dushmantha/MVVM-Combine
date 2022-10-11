    //
    //  CategoriesModel.swift
    //  EllumeCodingExercise
    //
    //  Created by Tharaka Dushmantha on 3/04/22.
    //

import Foundation

struct Success:Decodable {
    let total: Int
}

struct CategoriesContents: Decodable {
    let categories: [String : String]?
}

struct CategoriesModel: Decodable {
    let success : Success
    let contents : CategoriesContents
    
    
        // CodingKey isn't usefull in this case, as API return expected format
    enum CodingKeys: String, CodingKey {
        case success
        case contents
        
    }
}


extension CategoriesModel{
        // Mock data for preview.
    /*
     {
     "success": {
     "total": 8
     },
     "contents": {
     "categories": {
     "inspire": "Inspiring Quote of the day",
     "management": "Management Quote of the day",
     "sports": "Sports Quote of the day",
     "life": "Quote of the day about life",
     "funny": "Funny Quote of the day",
     "love": "Quote of the day about Love",
     "art": "Art quote of the day ",
     "students": "Quote of the day for students"
     }
     },
     "baseurl": "https://theysaidso.com",
     "copyright": {
     "year": 2024,
     "url": "https://theysaidso.com"
     }
     }
     */
    static let mockData: CategoriesModel = {
        CategoriesModel(success: Success( total: 8), contents: CategoriesContents(categories: ["inspire": "Inspiring Quote of the day", "management": "Management Quote of the day","sports": "Sports Quote of the day","life": "Quote of the day about life", "funny": "Funny Quote of the day","love": "Quote of the day about Love","art": "Art quote of the day ","students": "Quote of the day for students"]))
    }()
    
    static let emptyData: CategoriesModel = {CategoriesModel(success:  Success( total: 0), contents: CategoriesContents(categories: nil))}()
}
