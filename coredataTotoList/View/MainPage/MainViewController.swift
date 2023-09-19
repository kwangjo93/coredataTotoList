//
//  MainViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit


final class MainViewController: UIViewController {

   private var mainView = MainView()
   private var imageUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"
   
    weak var coordinator: MainCoordinator?
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        setupNaviBar()
        todoButtonAction()
        completedButtonAction()
        profileButtoAction()
    }
    
    override func loadView() {
        self.view = self.mainView
    }
    
    private func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func loadImage() {
        guard let url = URL(string: imageUrl) else { return }
            
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    self.mainView.mainImageView.image = UIImage(data: data)
                }
            }
        }
    
   private func todoButtonAction() {
            mainView.todoButton.addTarget(self, action: #selector(todoButtonTapped), for: .touchUpInside)
        }
    
    @objc func todoButtonTapped() {
        
    }
    
    private func completedButtonAction() {
        mainView.completedButton.addTarget(self, action: #selector(completedButtonTapped), for: .touchUpInside)
        }
    
    @objc func completedButtonTapped() {
        
    }
    
   private func profileButtoAction() {
        mainView.profileButton.addTarget(self, action: #selector(profileButtoTapped), for: .touchUpInside)
        }
    
    @objc func profileButtoTapped() {
       let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start(vc: self, viewModel: viewModel)
    }
    
}

