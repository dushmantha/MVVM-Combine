    //
    //  CategoriesViewModel.swift
    //  EllumeCodingExercise
    //
    //  Created by Tharaka Dushmantha on 3/04/22.
    //
import Foundation

protocol CategoriesViewModel : ObservableObject {
    func fetchCategories() async
}

final class CategoriesViewModelImplementation : CategoriesViewModel {
    @Published private(set) var categoryNames: [String]?
    private let fetchCategoriesService : FetchCategoriesService
    
        // dependency injection
    init(fetchCategoriesService: FetchCategoriesService){
        self.fetchCategoriesService = fetchCategoriesService
    }
    
    /*
     Mathod : Fetching categories - protocol
     Params : nil
     return : nil
     */
    
    func fetchCategories() async  {
        do{
            let categories = try await fetchCategoriesService.fetchCategories()
            self.categoryNames = categories.contents.categories!.map({$0.key}).sorted { $0 < $1 }
        } catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
    }
}
