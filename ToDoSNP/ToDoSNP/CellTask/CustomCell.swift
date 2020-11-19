//
//  CustomCell.swift
//  ToDoSNP
//
//  Created by Emil Mubarakov on 25.10.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    static var customCell = "cellTask"
    
    let checkBoxImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Medium", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.alpha = 0.1
        view.backgroundColor = UIColor.rgb(red: 37, green: 42, blue: 49)
        return view
    }()
    
    let taskMarkView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        self.addSubview(checkBoxImageView)
        self.addSubview(taskLabel)
        self.addSubview(lineView)
        self.addSubview(taskMarkView)
        checkBoxImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(28)
            make.leading.equalTo(16)
            make.centerY.equalTo(self)
        }
        taskLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(60)
            make.top.equalTo(19)
            make.centerY.equalTo(self)
            make.trailing.equalTo(-44)
        }
        lineView.snp.makeConstraints { (make) in
            make.bottom.trailing.equalTo(0)
            make.height.equalTo(1)
            make.leading.equalTo(60)
        }
        taskMarkView.snp.makeConstraints { (make) in
            make.height.width.equalTo(12)
            make.centerY.equalTo(self)
            make.trailing.equalTo(-16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
}
