//
//  LatLonSearchViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

protocol LatLonDataDelegate {
    func LatLonDataDelegate(lat:String,lon:String)
}

class LatLonSearchViewController: UIViewController {
    
    let latlonView:LatLonSearchView = .init()
    
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
        present(weatherDetailViewController, animated: true, completion: nil)
        
        ///pass lat lon data
        let latlonData:LatLonDataDelegate!
//        latlonData.LatLonDataDelegate(lat: <#T##String#>, lon: <#T##String#>)
    }
    
    func setNavigationBar(){
        title = "輸入經緯度"
        
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
    
    //WhereCanGetTheInputData?

}

extension LatLonSearchViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}
