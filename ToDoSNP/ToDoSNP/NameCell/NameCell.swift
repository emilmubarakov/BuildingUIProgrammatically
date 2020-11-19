//
//  NameCell.swift
//  ToDoSNP
//
//  Created by Emil Mubarakov on 28.10.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit
import SnapKit

class NameTableViewCell: UITableViewCell {
    
    static let identifier = "nameTableViewCell"
    
    let listNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        listNameLabel.layer.opacity = 0.3
        addToSubview()
        setupSnpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
        
    func addToSubview() {
            self.addSubview(listNameLabel)
        }
        
    func setupSnpView() {
        listNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(32)
            make.leading.equalTo(60)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
