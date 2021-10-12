//
//  WeatherViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherMainViewController: UIViewController {
    
    let weatherView:WeatherView = .init()
    let weatherFooterView:WeatherFooterView = .init()
    var weatherArray = WeatherArray()
    var temp:TemperatureUnit = .c{
        didSet{
            weatherView.tableView.reloadData()
        }
    }
    
    weak var weatherDataDelegate:PassWeatherToMainPageDelegate?
    
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
        setSearchLatLon()
        
    }
    //MARK:-setMethodForCeisiusAndFahrenheitColorChange
    @objc func labelColorChange(){
        print("colorChange")

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
        let searchViewController = SearchViewController()
        searchViewController.modalPresentationStyle = .formSheet
        searchViewController.modalTransitionStyle = .coverVertical
        let nav = UINavigationController(rootViewController: searchViewController)
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
        let labelChange = UITapGestureRecognizer(target: self, action: #selector(WeatherMainViewController.labelColorChange))
        weatherFooterView.tempStackView.addGestureRecognizer(labelChange)
    }
    
    //MARK:-setSearch
    func setSearchCity(){
        weatherFooterView.locationSearchMark.addTarget(self, action: #selector(WeatherMainViewController.toSearchPage), for: .touchUpInside)
    }
    
    //MARK:-setSearchByLatLon
    func setSearchLatLon(){
        weatherFooterView.latLonSearchMark.addTarget(self, action: #selector(WeatherMainViewController.toSearchLatLonPage), for: .touchUpInside)
    }
    
    func setWeatherDelegate(){
        weatherDataDelegate = self
    }
    
}

//MARK:-extensionForTableView

extension WeatherMainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the Cell number For WeatherPage
        return weatherArray.todayWeatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return the Cell content For WeatherPage
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherViewTableViewCell.reuseIdentifier, for: indexPath) as! WeatherViewTableViewCell
        
        let weather = weatherArray.todayWeatherData[indexPath.row]
        cell.configuration(currentWeather: weather)
        
        return cell
    }
    
    ///tableEditing
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //1.can touch the cell
        
        
        //2.touch the cell will present the weatherDetailPage
        
        
        //3.pass the value to weatherDetailPage
    }
    
    ///
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //set the tableView row height
        
        return 200
    }
    
    
    ///Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return weatherFooterView
    }
    
}


//MARK:-setReceiveData
extension WeatherMainViewController:PassWeatherToMainPageDelegate{
    func weatherToMainPage(data: CurrentWeatherData) {
        //get the Pass data
        weatherArray.todayWeatherData.append(data)
    }
    
}
