//
//  ProfileViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit


final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let footerView = CollectionFooterView()
    private var collectionView: UICollectionView!
    private let flowLayout = UICollectionViewFlowLayout()
    
    var viewModel: ViewModel
    
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var coordinator: ProfileCoordinator?
    weak var coordinator1: TodoCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        setupCollectionView()
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCell")
        layoutCollectionView()
        configureUI()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    // MARK: - 컬렉션 뷰 오토레이아웃 및 셋팅
    private func layoutCollectionView() {
        [profileView, collectionView, footerView].forEach {view.addSubview($0) }
        profileView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        profileView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        profileView.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 475).isActive = true
        
        footerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        footerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }

    
    private func configureUI() {
        self.title = "Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(rightBarButtonAction))
        
        profileView.postNumberLabel.text = String(viewModel.getData().filter { $0.isCompleted == true }.count)

    }
    
    @objc func rightBarButtonAction() {
        
    }

    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        flowLayout.scrollDirection = .vertical
    
        let collectionCellWidth = (UIScreen.main.bounds.width - 4) / 3
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = flowLayout
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


// MARK: - CollectionView DataSource & Delegate
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getData().filter { $0.isCompleted == true }.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCollectionViewCell
        let arrayData = viewModel.getData().filter { $0.isCompleted == true }
        let data = arrayData[indexPath.row]
        let image = UIImage(data: data.mainImage)
        cell.mainImageView.image = image ?? UIImage(systemName: "person")!
        cell.backgroundColor = .clear
        return cell
    }
    
    
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let task = viewModel.getData()[indexPath.row]
//        self.coordinator?.detailShow(task: task)
        let dd = DetailViewController(viewModel: self.viewModel)
        dd.task = task
        dd.viewModel = viewModel
        self.present(dd, animated: true)
        
    }
    
    }
    



