//
//  CompletedViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

class CompletedViewController: UIViewController {

    private let tableView = UITableView()
    
    var viewModel: ViewModel
    
    lazy var deleteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonTapped))
        return button
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var coordinator: CompletedCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewSetup()
        setTableView()
        self.navigationItem.rightBarButtonItem = deleteButton
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        viewModel.getData()
    }
    
    @objc func deleteButtonTapped() {
        if tableView.isEditing {
                tableView.setEditing(false, animated: true)
            } else {
                tableView.setEditing(true, animated: true)
            }
    }
    
    // MARK: - 테이블 뷰 관련
    private func tableViewSetup() {
        view.addSubview(tableView)
        title = "완료된 일 보기"
        self.tableView.register(CompletedTableViewCell.self, forCellReuseIdentifier: "CompletedCell")
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
}


extension CompletedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getData().filter { $0.isCompleted == false }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath) as! CompletedTableViewCell
        
        let todo = viewModel.getData().filter { $0.isCompleted == false }
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

extension CompletedViewController: UITableViewDelegate {    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 예시: 데이터 모델에서 삭제
            let arrayData = viewModel.getData()
            let data = arrayData[indexPath.row]
            viewModel.deleteData(task: data) {
                print("데이터 삭제 완료")
            }
            // 테이블 뷰에서 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
