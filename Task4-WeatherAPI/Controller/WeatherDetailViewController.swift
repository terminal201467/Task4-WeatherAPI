//
//  ViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    ///GetWeather
    let weatherAPI = WeatherAPI()
    
    ///View
    let weatherDetailView:WeatherDetailView = .init()
    
    ///DataStruct
    var weatherDetail:WeatherDetail = .init()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    fileprivate func extractedFunc() {
        setNavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }
    
    //MARK:-MethodForNavigationBar
    @objc func addWeather(){
        ///dismiss
        dismiss(animated: true, completion: nil)
        ///passValue
        
        ///backToTheWeatherMainPage
    }
    
    @objc func backToSearchPage(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:-setNavigationBar
    private func setNavigationController(){
        ///why the navigationBar didn't show up?
        title = "當日天氣"
        navigationController?.navigationBar.tintColor = .white
        let addButton = UIBarButtonItem(title: "加入",
                                        style: .plain,
                                        target: self,
                                        action: #selector(WeatherDetailViewController.addWeather))
        
        let cancelButton = UIBarButtonItem(title: "取消",
                                           style: .plain,
                                           target: self,
                                           action: #selector(WeatherDetailViewController.backToSearchPage))
        
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = cancelButton
    }
}

//MARK:-setDataPass
extension WeatherDetailViewController:CityDataDelegate,LatLonDataDelegate{
    ///accept the city Data
    func cityDataDelegate(text: String) {
        ///request the weather data by city
        print(text)
        
//        print("確認城市搜尋頁面的傳值:\(weatherAPI.weatherDetail.city)")
        
        ///the get weather data should receive by a DataStruct
        
    }
    
    ///accept the lat lon Data
    func LatLonDataDelegate(lat: String, lon: String) {
        ///request the weather data by lat lon
        
        print(lat)
        print(lon)
        
        
    }
}

