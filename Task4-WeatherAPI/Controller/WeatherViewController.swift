//
//  WeatherViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let weatherView:WeatherView = .init()
    let weatherFooterView:WeatherFooterView = .init()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegateAndDataSource()
        setTempLabelChange()
        setSearchCity()
        
    }
    //MARK:-setMethodForCeisiusAndFahrenheitColorChange
    @objc func labelColorChange(){
        print("colorChange")
        
        var temp:TemperatureUnit = .c{
            didSet{
                
            }
        }
        //colorChange
        if temp == .c{
            print("c")
            weatherFooterView.ceisiusLabel.textColor = .white
            weatherFooterView.fahrenheitLabel.textColor = .gray
            temp = .f
            
            //UnitChange
            
        }else{
            print("f")
            weatherFooterView.ceisiusLabel.textColor = .gray
            weatherFooterView.fahrenheitLabel.textColor = .white
            temp = .c
            
            //UnitChange
        }
    }
    
    //MARK:-setMethodForSearchMark
    @objc func toSearchPage(){
        let weatherViewController = WeatherViewController()
        weatherViewController.modalPresentationStyle = .formSheet
        weatherViewController.modalTransitionStyle = .coverVertical
        let nav = UINavigationController(rootViewController: weatherViewController)
        present(nav, animated: true)
    }
    
    @objc func toSearchLatLonPage(){
        ///create a new page
        let latLonSearchViewController = LatLonSearchViewController()
        latLonSearchViewController.modalPresentationStyle = .formSheet
        latLonSearchViewController.modalTransitionStyle = .coverVertical
        let nav = UINavigationController(rootViewController: latLonSearchViewController)
        present(nav, animated: true)
    }
    
    //MARK:-setTableViewDelegateAndDataSource
    func setTableViewDelegateAndDataSource(){
        weatherView.tableView.delegate = self
        weatherView.tableView.dataSource = self
    }
    
    //MARK:-setTempLabelChange
    func setTempLabelChange(){
        let labelChange = UITapGestureRecognizer(target: self, action: #selector(WeatherViewController.labelColorChange))
        weatherFooterView.tempStackView.addGestureRecognizer(labelChange)
    }
    
    //MARK:-setSearch
    func setSearchCity(){
        weatherFooterView.locationSearchMark.addTarget(self, action: #selector(WeatherViewController.toSearchPage), for: .touchUpInside)
    }
    
    //MARK:-setSearchByLatLon
    func setSearchLatLon(){
        weatherFooterView.latLonSearchMark.addTarget(self, action: #selector(WeatherViewController.toSearchLatLonPage), for: .touchUpInside)
    }
    
}

//MARK:-extensionForTableView

extension WeatherViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return the Cell number For WeatherPage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //return the Cell content For WeatherPage
    }
    

}
