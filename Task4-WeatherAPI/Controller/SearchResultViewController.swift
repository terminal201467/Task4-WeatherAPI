//
//  SearchResultViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/30.
//

import UIKit
//setToPass


class SearchResultViewController: UIViewController {
    
    let searchResultView:SearchResultView = .init()

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = searchResultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewdelegateDataSource()
        
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
        //ReturnTheNumberOfArrayCount
    }
    //theDataContentInCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.RegisterTheCell
        
        //2.TheCellLabelContent
        
        //3.returnCell
        
    }
    
    //WhenSelectCellWouldHappend
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //1.CellBeSelect(InTheTableCell)
        
        //2.PassTheDataToDetailPage
        let cityDataPass:CityDataDelegate!
//        cityDataPass.cityDataDelegate(text: <#T##String#>)
        
        //3.ShowUPtheWeatherDetailPage
        
    }
    
}


