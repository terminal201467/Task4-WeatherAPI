//
//  WeatherViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

protocol PassWeatherToMainPageDelegate:AnyObject{
    func weatherToMainPage(_ data:CurrentWeatherData)
}

class WeatherMainViewController: UIViewController {

    ///View
    let weatherView:WeatherView = .init()
    
    ///FooterView
    let weatherFooterView:WeatherFooterView = .init()
    
    ///DataStruct
    var weatherArray = WeatherArray()
    
    ///Temperature
    var temp:TemperatureUnit = .c{
        didSet{
            weatherView.tableView.reloadData()
        }
    }
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        ///ReferenceTheMainVC
        ///ToCreateTheBridgeConnect
        searchViewController.mainVC = self
        
        searchViewController.modalPresentationStyle = .formSheet
        searchViewController.modalTransitionStyle = .coverVertical
        let nav = UINavigationController(rootViewController: searchViewController)
        present(nav, animated: true)
    }
    
    @objc func toSearchLatLonPage(){

        let latLonSearchViewController = LatLonSearchViewController()
        latLonSearchViewController.mainVC = self
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
        tableView.deselectRow(at: indexPath, animated: false)
        
        //2.touch the cell will present the weatherDetailPage
        let weatherDetailViewController = WeatherDetailViewController()
        weatherDetailViewController.modalTransitionStyle = .coverVertical
        weatherDetailViewController.modalPresentationStyle = .formSheet
        let nav = UINavigationController(rootViewController: weatherDetailViewController)
        present(nav, animated: true, completion: nil)
        
        //3.showTheWeatherDetailPage,AndNeedTheData
    }
        
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.weatherArray.todayWeatherData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
    func weatherToMainPage(_ data: CurrentWeatherData) {
        //GetThePassData
        weatherArray.todayWeatherData.append(data)
        weatherView.tableView.reloadData()
    }

}
