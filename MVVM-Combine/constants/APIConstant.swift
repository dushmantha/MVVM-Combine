    //
    //  APIConstant.swift
    //  EllumeCodingExercise
    //
    //  Created by Tharaka Dushmantha on 3/04/22.
    //

import Foundation

    // API constants
enum APIConstants{
    static let baseUrl = "https://quotes.rest/"
}

    // API error message
enum ServiceError: Error {
    case urlNotFound(String = "Missing URL")
    case statusNotOk(String = "Failed to find data.", statusCode: Int?)
    case decoderError(String = "Unable to decode data")
}

    // API http method
enum HTTPMethod: String{
    case get = "GET"
}

    // API last path
enum RelativePath : String{
    case categories = "qod/categories.json"
    case categoryDetails = "qod.json?category="
}
