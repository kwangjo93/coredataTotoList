//
//  CompletedViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

class CompletedViewController: UIViewController {

    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        setTableView()
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    // MARK: - 테이블 뷰 관련
    private func tableViewSetup() {
        title = "완료된 일 보기"
        self.tableView.register(CompletedTableViewCell.self, forCellReuseIdentifier: "CompletedCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setTableView() {
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
   

}


extension CompletedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath)
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}

extension CompletedViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
}
