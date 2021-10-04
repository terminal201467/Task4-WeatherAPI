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
    let weatherDetailViewController = WeatherDetailViewController()
    var cityAPI:CityAPI = .init()
    var searchController:UISearchController!
    
    var cityDataPass:CityDataDelegate?
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = searchView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
        setTableViewDelegateDataSource()
        cityAPI.ReadJson()
        
        
    }
    
    //MARK:-setSeachController
    func setSearchController(){
        
        searchController = UISearchController(searchResultsController:nil)
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
    
    //MARK:-setTableViewDelegateAndDataSource
    func setTableViewDelegateDataSource(){
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
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
            cityAPI.searchArray.filterArray(for: text)
            
            print("搜尋結果：\(cityAPI.searchArray.resultData)")
            print("搜尋列：\(text)")
        }
        searchView.tableView.reloadData()
    }
}

extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    //theDataCountInTheTable
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cityAPI.searchArray.resultData.count >= 1{
            
            return cityAPI.searchArray.resultData.count
            
        }else{
            
            return cityAPI.searchArray.cityNameArray.count
            
        }
        
    }
    //theDataContentInCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.RegisterTheCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)

        //2.TheCellLabelContent
        if cityAPI.searchArray.resultData.count >= 1{
            
            cell.textLabel?.text = cityAPI.searchArray.resultData[indexPath.row]
            
        }else{
            
            cell.textLabel?.text = cityAPI.searchArray.cityNameArray[indexPath.row]
        }
        
        return cell
    }
    
    //WhenSelectCellWouldHappend
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1.CellBeSelect(InTheTableCell)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //2.PassTheDataToDetailPage
        cityDataPass?.cityDataDelegate(text: cityAPI.searchArray.resultData[indexPath.row])
        
        //3.ShowUPtheWeatherDetailPage
        weatherDetailViewController.modalTransitionStyle = .coverVertical
        weatherDetailViewController.modalPresentationStyle = .formSheet
        present(weatherDetailViewController, animated: true, completion: nil)
        
    }
}
