//
//  SearchResultViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/30.
//

import UIKit

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
        //RegisterTheCell
        
        //TheCellLabelContent
        
        //returnCell
    }
    
    //WhenSelectCellWouldHappend
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //CellBeSelect(InTheTableCell)
        
        //PassTheDataToDetailPage
        
        //ShowUPtheWeatherDetailPage
        
    }
    
}
