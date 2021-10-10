//
//  ViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let weatherAPI = WeatherAPI()
    let weatherDetailView = WeatherDetailView()
    let weatherHeaderView:WeatherDetailHeaderView = .init()
    
    //MARK:-LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegate()
//        getWeatherData()

    }
    
    //MARK:-setMethodGetWeatherData

    
    func setTableViewDelegate(){
        weatherDetailView.tableView.delegate = self
        weatherDetailView.tableView.dataSource = self
    }
}

extension WeatherDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherAPI.weatherDetail.weatherDetailDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.register
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetail", for: indexPath)
        
        //2.cell content
        cell.textLabel?.text = weatherAPI.weatherDetail.weatherDetailDataArray[indexPath.row]
        
        //3.return cell
        return cell
    }
    ///Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return weatherHeaderView
    }
}


//MARK:-setDataPass
extension WeatherDetailViewController:CityDataDelegate,LatLonDataDelegate{
    ///accept the city Data
    func cityDataDelegate(text: String) {
        ///request the weather data by city
        
        print("確認城市搜尋頁面的傳值\(text)")
        ///the get weather data should receive by a DataStruct
        
//        print("程式資料結構：\(weatherAPI.weatherDetail.city)")
        
    }
    
    ///accept the lat lon Data
    func LatLonDataDelegate(lat: String, lon: String) {
        ///request the weather data by lat lon
        print("\(lat)")
        if lat != nil && lon != nil{
            weatherAPI.weatherDetail.latString = lat
            weatherAPI.weatherDetail.lonString = lon
        }
        ///the get weather data should receive by a DataStruct
//        print("經度傳值：\(weatherAPI.weatherDetail.latString)")
//        print("緯度傳值：\(weatherAPI.weatherDetail.lonString)")
        
    }
}

