//
//  SearchResultViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/30.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    let searchResultView:SearchResultView = .init()
    let searchArray = SearchArray()
    let cityAPI = CityAPI()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = searchResultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewdelegateDataSource()
        cityAPI.ReadJson()
        
    }
    
    //MARK:-setTableViewDelegateAndDataSource
    func setTableViewdelegateDataSource(){
        searchResultView.tableView.delegate = self
        searchResultView.tableView.dataSource = self
    }
}

extension SearchResultViewController:UITableViewDelegate,UITableViewDataSource{
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
            
            cell.textLabel?.text = cityAPI.searchArray.resultData.description
            
        }else{
            
            cell.textLabel?.text = cityAPI.searchArray.cityNameArray.description
        }
        
        searchResultView.tableView.reloadData()
        return cell
    }
    
    //WhenSelectCellWouldHappend
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //1.CellBeSelect(InTheTableCell)
        
        //2.PassTheDataToDetailPage
        let cityDataPass:CityDataDelegate!
//        cityDataPass.cityDataDelegate(text: <#T##String#>)
        
        //3.ShowUPtheWeatherDetailPage
        let weatherDetailViewController = WeatherDetailViewController()
        weatherDetailViewController.modalTransitionStyle = .coverVertical
        weatherDetailViewController.modalPresentationStyle = .formSheet
        present(weatherDetailViewController, animated: true, completion: nil)
        
    }
    
    
}


