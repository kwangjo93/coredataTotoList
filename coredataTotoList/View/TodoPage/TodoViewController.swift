//
//  TodoViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import SwiftUI

final class TodoViewController: UIViewController {

    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = tableView
        tableViewSetup()
        
    }
    
    // MARK: - 테이블 뷰 관련
    private func tableViewSetup() {
        self.tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
//    private func taskChecking() {
//        if completedSwitch.isOn {
//            self.title.attributedText = NSAttributedString(string: task.title)
//            isSeclec = sender.isOn
//            task.isCompleted = isSeclec
//            completedSwitch.isOn = isSeclec
//        } else {
//            self.title.attributedText = self.title.text?.strikeThrough()
//            isSeclec = sender.isOn
//            task.isCompleted = isSeclec
//            completedSwitch.isOn = isSeclec
//        }
//    }
    
    
    struct MyViewController_PreViews: PreviewProvider {
        static var previews: some View {
            TodoViewController().toPreview()
        }
    }

}


extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}

extension TodoViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
}
