//
//  ListCell.swift
//  ToDoSNP
//
//  Created by Emil Mubarakov on 28.10.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "listTableViewCell"
    
    let tasksView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let listNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 19)
        label.layer.opacity = 0.9
        return label
    }()
    
    let countTasksLabel: UILabel = {
        let label = UILabel()
        label.layer.opacity = 0.5
        label.font = UIFont(name: "SFProText-Regular", size: 14)
        return label
    }()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addToSubview()
        setupSnpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
        
    func addToSubview() {
        self.addSubview(tasksView)
        self.addSubview(listNameLabel)
        self.addSubview(countTasksLabel)
    }
        
    func setupSnpView() {
        tasksView.snp.makeConstraints { (make) in
            make.leading.equalTo(58)
            make.top.equalTo(8)
            make.trailing.equalTo(-16)
            make.height.equalTo(69)
        }
        
        listNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(74)
            make.top.equalTo(20)
        }
        
        countTasksLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(74)
            make.bottom.equalTo(-13)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
