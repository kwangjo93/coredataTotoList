//
//  TodoViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

final class TodoViewController: UIViewController {
    
    private let tableView = UITableView()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    weak var coordinator : TodoCoordinator?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dataArray = viewModel.getData()
    
    override func viewDidLoad() {
        print(viewModel.getData())
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.backgroundColor = .white
        dataArray = viewModel.getData()
        tableViewSetup()
        setTableView()
        self.navigationItem.rightBarButtonItem = plusButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataArray = viewModel.getData()
        tableView.reloadData()
    }
  
    
    // MARK: - 테이블 뷰 관련
    private func tableViewSetup() {
        view.addSubview(tableView)
        title = "할일 확인하기"
        self.tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    @objc func plusButtonTapped() {
        self.coordinator?.newDetailShow()
    }
    
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
     
        let todo = viewModel.getData()
        let data = todo[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.dateLabel.text = data.createDateString
        cell.completedSwitch.isOn = data.isCompleted
        cell.task = data
        cell.viewModel = self.viewModel
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    
}

extension TodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.getData()[indexPath.row]
        
        self.coordinator?.updateDetailShow(task: data, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



//테이블 뷰 삭제하기(삭제에 대한 반응처리 -> 클로저)
//프로필매니저에 대한 내용
//코어데이터 카테고리 지정. 저장 -> 피커뷰
