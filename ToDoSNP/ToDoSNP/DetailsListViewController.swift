//
//  DetailsListViewController.swift
//  ToDoSNP
//
//  Created by Emil Mubarakov on 18.11.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit
import SnapKit

class DetailsListViewController: UIViewController {
    
    var listColor = UIColor()
    var listName = String()
    var listTask = String()
    var listLettersColor = UIColor()
    
    var arrayTasks: [ToDoTask] = []
    
    let viewDetail: UIView = {
        let view = UIView()
        return view
    }()
    
    let detailListTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        return label
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        return label
    }()
    
    let createNewTask: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let pencil: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailListTableView.delegate = self
        detailListTableView.dataSource = self
        
        detailListTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.customCell)
        
        createNewTask.layer.cornerRadius = 32
        createNewTask.backgroundColor = UIColor.white
        createNewTask.layer.shadowOpacity = 0.25
        createNewTask.layer.shadowRadius = 5
        createNewTask.layer.shadowOffset = CGSize(width: 0, height: 10)
        createNewTask.setImage(#imageLiteral(resourceName: "Combined Shape"), for: .normal)
        
        if listLettersColor == UIColor.rgb(red: 255, green: 255, blue: 255) {
            pencil.setImage(#imageLiteral(resourceName: "whitePensel"), for: .normal)
        } else {
            pencil.setImage(#imageLiteral(resourceName: "darkPensel"), for: .normal)
        }
        
        viewDetail.backgroundColor = listColor
        nameLabel.text = listName
        nameLabel.textColor = listLettersColor
        taskLabel.text = listTask
        taskLabel.textColor = listLettersColor
        taskLabel.layer.opacity = 0.5
        detailListTableView.backgroundColor = listColor
        detailListTableView.separatorStyle = .none
        
        for item in 0...DataToDo.shared.tasks.count - 1{
            if DataToDo.shared.tasks[item].markColor == listColor {
                arrayTasks.append(DataToDo.shared.tasks[item])
            }
        }
        addToSubview()
        setupSnpView()
        
    }
        
    func addToSubview() {
        self.view.addSubview(viewDetail)
        self.view.addSubview(detailListTableView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(taskLabel)
        self.view.addSubview(createNewTask)
        self.view.addSubview(pencil)
    }
    
    func setupSnpView() {
        viewDetail.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.trailing.equalTo(0)
            make.bottom.equalTo(647)
        }
        
        detailListTableView.snp.makeConstraints { (make) in
            make.top.equalTo(121)
            make.leading.trailing.bottom.equalTo(0)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(32)
            make.leading.trailing.equalTo(60)
        }
        
        taskLabel.snp.makeConstraints { (make) in
            make.top.equalTo(76)
            make.leading.trailing.equalTo(60)
        }
        
        createNewTask.snp.makeConstraints { (make) in
            make.bottom.equalTo(-44)
            make.trailing.equalTo(-16)
            make.height.width.equalTo(64)
        }
        
        pencil.snp.makeConstraints { (make) in
            make.height.width.equalTo(24)
            make.trailing.equalTo(-12)
            make.top.equalTo(40)
        }
        
    }
}

extension DetailsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.customCell, for: indexPath) as! CustomCell
        
        
        cell.backgroundColor = listColor
        cell.taskLabel.textColor = listLettersColor
        cell.checkBoxImageView.image = #imageLiteral(resourceName: "Unmarked")
        
        if listLettersColor == UIColor.rgb(red: 255, green: 255, blue: 255) {
            cell.checkBoxImageView.image = #imageLiteral(resourceName: "UnmarkedWhite")
        } else {
            cell.checkBoxImageView.image = #imageLiteral(resourceName: "Unmarked")
        }
    
        cell.taskLabel.text = arrayTasks[indexPath.row].title
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
