//
//  ViewController.swift
//  ToDoSNP
//
//  Created by Emil Mubarakov on 25.10.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let imageThreePoint: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "More")
        return image
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        return label
    }()
    
    let createNewTask: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(createNewTaskActionButton), for: .touchUpInside)
        return button
    }()
    
    let createListOrTaskView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let createListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("List", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Regular", size: 18)
        button.titleEdgeInsets = UIEdgeInsets(top: 19, left: 12, bottom: 19, right: 100)
        button.setImage(#imageLiteral(resourceName: "Lists.png"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 19, left: 19, bottom: 19, right: 179)
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    let createTaskButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Task", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Regular", size: 18)
        button.titleEdgeInsets = UIEdgeInsets(top: 19, left: 12, bottom: 19, right: 100)
        button.setImage(#imageLiteral(resourceName: "Task"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 19, left: 19, bottom: 19, right: 179)
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 37, green: 42, blue: 49)
        view.alpha = 0.1
        return view
    }()
    
    let opacitiView: UIView = {
        let view = UIView()
        return view
    }()
    
    var plusImages: [UIImage] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.backgroundColor = .white
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.customCell)
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        addToSubview()
        setupSnpView()
        
        opacitiView.isHidden = true
        opacitiView.backgroundColor = UIColor.white
        opacitiView.layer.opacity = 0.7
        
        createNewTask.layer.cornerRadius = 32
        createNewTask.backgroundColor = UIColor.white
        createNewTask.layer.shadowOpacity = 0.25
        createNewTask.layer.shadowRadius = 5
        createNewTask.layer.shadowOffset = CGSize(width: 0, height: 10)
        createNewTask.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        createNewTask.setImage(#imageLiteral(resourceName: "Plus0.png"), for: .normal)
        
        plusImages = createImageArray(total: 5, imagePrefix: "Plus")
        
        createListOrTaskView.layer.cornerRadius = 15
        createListOrTaskView.isHidden = true
        createListOrTaskView.layer.shadowOpacity = 0.25
        createListOrTaskView.layer.shadowRadius = 5
        createListOrTaskView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    @objc func createNewTaskActionButton() {
        opacitiView.isHidden = !opacitiView.isHidden
        createListOrTaskView.isHidden = !createListOrTaskView.isHidden
        
        if createListOrTaskView.isHidden == true {
            UIView.animate(withDuration: 0.5) {
                self.createNewTask.backgroundColor = UIColor.white
            }
            animate(imageView: createNewTask.imageView!, images: plusImages.reversed())
            createNewTask.setImage(#imageLiteral(resourceName: "Plus0.png"), for: .normal)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.createNewTask.backgroundColor = UIColor.rgb(red: 10, green: 132, blue: 255)
            }
            animate(imageView: createNewTask.imageView!, images: plusImages)
            createNewTask.setImage(#imageLiteral(resourceName: "Plus4.png"), for: .normal)
        }
    }
    
    func addToSubview() {
        self.view.addSubview(tableView)
        self.view.addSubview(dayLabel)
        self.view.addSubview(imageThreePoint)
        self.view.addSubview(opacitiView)
        self.view.addSubview(createNewTask)
        self.view.addSubview(createListOrTaskView)
        createListOrTaskView.addSubview(createListButton)
        createListOrTaskView.addSubview(createTaskButton)
        createListOrTaskView.addSubview(separatorView)
    }
    
    func setupSnpView() {
        opacitiView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(0)
        }
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(0)
            make.top.equalTo(117)
        }
        
        dayLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(60)
        }
        
        imageThreePoint.snp.makeConstraints { (make) in
            make.top.equalTo(77)
            make.trailing.equalTo(-12)
            make.height.width.equalTo(24)
        }
        
        createNewTask.snp.makeConstraints { (make) in
            make.height.width.equalTo(64)
            make.bottom.equalTo(-44)
            make.trailing.equalTo(-16)
        }
        
        createListOrTaskView.snp.makeConstraints { (make) in
            make.height.equalTo(120)
            make.width.equalTo(220)
            make.bottom.equalTo(-124)
            make.trailing.equalTo(-16)
        }
        
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.width.equalTo(220)
            make.top.equalTo(59)
            make.leading.trailing.equalTo(0)
        }
        
        createListButton.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo(220)
        }
        
        createTaskButton.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo(220)
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataToDo.shared.tasks.count + 1 + DataToDo.shared.lists.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 || indexPath.row > 3 && indexPath.row < 5 {
            return 60
        } else if indexPath.row == 3 {
            return 81
        } else if indexPath.row == 5 {
            return 59
        }
        return 77
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.customCell, for: indexPath) as! CustomCell
            let todo = DataToDo.shared.tasks[indexPath.row]
            
            cell.taskLabel.text = todo.title
            cell.taskMarkView.backgroundColor = todo.markColor
            cell.checkBoxImageView.image = todo.isMarked == true ? UIImage(named: "Marked") : UIImage(named: "Unmarked")
            cell.taskLabel.layer.opacity = todo.opacity == 1 ? 1 : 0.5
            
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as! NameTableViewCell
            cell.listNameLabel.text = "Lists"
            cell.listNameLabel.textColor = UIColor.rgb(red: 37, green: 42, blue: 49)
            cell.selectionStyle = .none
                
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        
        let tasks = DataToDo.shared.lists[indexPath.row - 6]
        
        cell.listNameLabel.text = tasks.listName
        cell.tasksView.backgroundColor = tasks.backgroundColor
        cell.countTasksLabel.text = tasks.countTasks
        cell.listNameLabel.textColor = tasks.lettersColor
        cell.countTasksLabel.textColor = tasks.lettersColor
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < 5 {
        
            guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else {return}
            
            var todo = DataToDo.shared.tasks[indexPath.row]
            todo.isMarked = !todo.isMarked
            if todo.isMarked == true {
                todo.opacity = 0.5
            } else {
                todo.opacity = 1
            }
            
            DataToDo.shared.tasks.remove(at: indexPath.row)
            DataToDo.shared.tasks.insert(todo, at: indexPath.row)
            
            cell.taskLabel.layer.opacity = todo.opacity == 1 ? 1 : 0.5
            cell.checkBoxImageView.image = todo.isMarked == true ? UIImage(named: "Marked") : UIImage(named: "Unmarked")
            
        }
        
        if indexPath.row > 5 {
            
            let DvC = DetailsListViewController()
            
            guard let cell = tableView.cellForRow(at: indexPath) as? ListTableViewCell else {return}
        
            
            DvC.listColor = cell.tasksView.backgroundColor!
            DvC.listName = cell.listNameLabel.text!
            DvC.listTask = cell.countTasksLabel.text!
            DvC.listLettersColor = cell.listNameLabel.textColor
            
            self.present(DvC, animated: true)
            
        }
    }
    
    
}

