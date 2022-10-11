    //
    //  ViewController.swift
    //  MVVM-Combine
    //
    //  Created by Tharaka on 11/10/2022.
    //

import UIKit
import Combine

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewModel: CategoriesViewModelImplementation = .init(fetchCategoriesService: FetchCategoriesServiceImplementation())
    var observer : AnyCancellable?
    var model = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        Task{
            await fetchData()
            observer =  viewModel.$categoryNames
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("print -- Finish")
                    case .failure :
                        print("print -- Finish")
                }
            }, receiveValue: { value in
                self.model = value ?? []
                self.tableView.reloadData()
            } )
        }
    }
    
    func fetchData() async{
        await viewModel.fetchCategories()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
}

