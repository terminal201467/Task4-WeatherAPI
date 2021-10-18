//
//  WeatherView.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherView: UIView {

    //tableView
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(WeatherViewTableViewCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.register(WeatherFooterView.self,forHeaderFooterViewReuseIdentifier: "Footer")
//        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //stackView
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    //intializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(stackView)
        autoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //autoLayout
    func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
