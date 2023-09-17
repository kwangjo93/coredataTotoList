//
//  ProfileViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit
import SwiftUI

final class ProfileViewController: UIViewController {

    private let collectionView = UICollectionView()
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let spacingWitdh: CGFloat = 1
    private let cellColumns: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCell")
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

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCollectionViewCell
        
        
        return cell
    }
    
}
