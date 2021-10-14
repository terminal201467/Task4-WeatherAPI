//
//  LatLonSearchViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

class LatLonSearchViewController: UIViewController {
    
    let latlonView:LatLonSearchView = .init()
    
    var weatherDetail:WeatherDetailData = .init()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = latlonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        setNavigationBar()
    }
    
    @objc func cancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func correct(){
        let weatherDetailViewController = WeatherDetailViewController()
        weatherDetailViewController.modalTransitionStyle = .coverVertical
        weatherDetailViewController.modalPresentationStyle = .formSheet
        let navigationWeatherViewController = UINavigationController(rootViewController: weatherDetailViewController)
        present(navigationWeatherViewController, animated: true, completion: nil)
        
        weatherDetailViewController.latLonStringPass(lat: weatherDetail.latString, lon: weatherDetail.lonString)
        print("觸發緯度：\(weatherDetail.latString)")
        print("觸發經度：\(weatherDetail.lonString)")
    }
    //MARK:-setNavigationBar
    private func setNavigationBar(){
        title = "輸入經緯度"
        navigationController?.navigationBar.tintColor = .white
        
        let correctButton = UIBarButtonItem(title: "確定", style: .plain, target: self, action: #selector(LatLonSearchViewController.correct))
        
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(LatLonSearchViewController.cancel))
        
        navigationItem.rightBarButtonItem = correctButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    //MARK:-textFieldDelegate
    func textFieldDelegate(){
        latlonView.latTextField.delegate = self
        latlonView.lonTextField.delegate = self
    }
}

extension LatLonSearchViewController: UITextFieldDelegate{
    ///when the return press will happend
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //1.Take value from textField
        weatherDetail.latString = latlonView.latTextField.text!
        weatherDetail.lonString = latlonView.lonTextField.text!

    }
}
