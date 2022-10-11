    //
    //  FetchCategoriesService.swift
    //  EllumeCodingExercise
    //
    //  Created by Tharaka Dushmantha on 3/04/22.
    //

import Foundation

protocol FetchCategoriesService {
    func fetchCategories() async throws ->CategoriesModel
}

struct FetchCategoriesServiceImplementation : FetchCategoriesService {
    let router  = Router()
    /*
     Mathod : fetching categories
     Params : nil
     return : Data decode from categories data response
     */
    func fetchCategories() async throws -> CategoriesModel {
        guard let decodedResponse = try? await JSONDecoder().decode(CategoriesModel.self, from: router.fetch(endPoint: .categories, queryParam: nil))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}
