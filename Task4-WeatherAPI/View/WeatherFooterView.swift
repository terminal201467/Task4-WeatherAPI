//
//  WeatherHeaderView.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/30.
//

import UIKit

class WeatherFooterView: UITableViewHeaderFooterView {

    static let identifier = "Footer"
    
    var ceisiusLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°C"
        label.textColor = .white
        return label
    }()
    
    let slash:UILabel = {
        var label = UILabel()
        label.text = "/"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var fahrenheitLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°F"
        label.textColor = .gray
        return label
    }()
    
    let searchCityLabel:UILabel = {
       var label = UILabel()
        label.text = "以城市搜尋->"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchByLatLon:UILabel = {
        var label = UILabel()
        label.text = "以經緯度搜尋->"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let locationSearchMark:UIButton = {
       let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "location.circle"),for:.normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
       return searchButton
    }()
    
    let latLonSearchMark:UIButton = {
        let searchButton = UIButton()
         searchButton.setImage(UIImage(named: "globe"),for:.normal)
         searchButton.translatesAutoresizingMaskIntoConstraints = false
        return searchButton
    }()
    
    ///combine city
    lazy var cityStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchCityLabel,locationSearchMark])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    ///combine latlon
    lazy var latlonStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchByLatLon,latLonSearchMark])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var tempStackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [ceisiusLabel,slash,fahrenheitLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    //
    lazy var searchStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityStackView,latLonSearchMark])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing  = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var footerStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tempStackView,searchStackView])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(ceisiusLabel)
        contentView.addSubview(slash)
        contentView.addSubview(fahrenheitLabel)
        
        contentView.addSubview(tempStackView)
        contentView.addSubview(cityStackView)
        contentView.addSubview(latLonSearchMark)
        contentView.addSubview(footerStackView)
        contentView.backgroundColor = .black
        
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        footerStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        footerStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        footerStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        footerStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
