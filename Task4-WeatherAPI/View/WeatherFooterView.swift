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
    
    let searchMark:UIButton = {
       let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "magnifyingglass"),for:.normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
       return searchButton
    }()
    
    lazy var stackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [ceisiusLabel,slash,fahrenheitLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    lazy var substackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackView,searchMark])
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
        
        contentView.addSubview(stackView)
        contentView.addSubview(substackView)
        contentView.backgroundColor = .black
        
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        substackView.translatesAutoresizingMaskIntoConstraints = false
        substackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        substackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        substackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        substackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
