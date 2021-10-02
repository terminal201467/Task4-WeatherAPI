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
    
    //MARK:-LifeCycle
    
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setTableViewDelegate()
        
    }
//    func setTableViewDelegate(){
//        weatherDetailView.tableView.delegate = self
//        weatherDetailView.tableView.dataSource = self
//    }
}

//extension WeatherDetailViewController:UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //these Detail need to Custom
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //these Detail need to Custom
//        //1.register
//
//        //2.cell content
//
//        //3.return cell
//    }
//}


//MARK:-setDataPass
//extension WeatherDetailViewController:CityDataDelegate,LatLonDataDelegate{
//    ///accept the city Data
//    func cityDataDelegate(text: String) {
//        ///request the weather data by city
//        
//    }
//    
//    ///accept the lat lon Data
//    func LatLonDataDelegate(lat: String, lon: String) {
//        ///request the weather data by lat lon
//        
//    }
//}

