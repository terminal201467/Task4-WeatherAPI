//
//  SearchViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

protocol CityDataDelegate {
    func cityDataDelegate(text:String)
}

//RememberWriteControllerOnly
class SearchViewController: UIViewController{

    //MARK:-setView
    let searchView:SearchView = .init()
    var searchArray:SearchArray = .init()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
        
    }
    
    //MARK:-setSeachController
    func setSearchController(){
        let searchResultViewControler = SearchResultViewController()
        let searchController = UISearchController(searchResultsController:searchResultViewControler)
        
        searchController.searchBar.placeholder = "搜尋"
        searchController.searchBar.setValue("取消", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .white
        searchController.searchBar.showsCancelButton = true
        searchController.searchBar.searchTextField.clearButtonMode = .whileEditing
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = true
        
        //naviagationBarEqualToSearchController
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)]
        title = "輸入城市"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //delegate
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
    }
    
}

//MARK:-setSearchBarDelegate
extension SearchViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK:-setSearchDataUpdater
extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
        //Everything about the searching Result will be handle in this scope
            searchArray.filterArray(for: text)
            
            print(text)
        }
    }
}
