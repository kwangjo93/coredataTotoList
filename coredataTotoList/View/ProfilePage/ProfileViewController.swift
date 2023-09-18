//
//  ProfileViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import SwiftUI

final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private var collectionView: UICollectionView!
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let spacingWitdh: CGFloat = 1
    private let cellColumns: CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        setupCollectionView()
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCell")
        layoutCollectionView()
    }
    
    override func loadView() {
        self.view = profileView
    }
    
  
    
    // MARK: - 컬렉션 뷰 오토레이아웃 및 셋팅
    private func layoutCollectionView() {
       
        profileView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.leadingAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        // 컬렉션뷰의 스크롤 방향 설정
        flowLayout.scrollDirection = .vertical
        
        //열의 갯수에서 -1의 열 라인에 따라 구하는 넓이..?
        let collectionCellWidth = (UIScreen.main.bounds.width - spacingWitdh * (cellColumns - 1)) / cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = spacingWitdh
        
        // 🫵🫵🫵 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
        
    }
    
    struct MyViewController_PreViews: PreviewProvider {
        static var previews: some View {
            ProfileViewController().toPreview()
        }
    }
}


// MARK: - CollectionView DataSource & Delegate
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCollectionViewCell
        
        
        return cell
    }
    
}



