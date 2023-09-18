//
//  MainViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import SwiftUI


final class MainViewController: UIViewController {

   private var mainView = MainView()
   private var imageUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"
   
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
        let profileVC = ProfileViewController()
        self.present(profileVC, animated: true)
        print("눌림")
    }
    
    
    
    
    
    struct MyViewController_PreViews: PreviewProvider {
        static var previews: some View {
            MainViewController().toPreview()
        }
    }
    
}


// MARK: - UI Preview
#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
