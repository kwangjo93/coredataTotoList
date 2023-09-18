//
//  ProfileCollectionViewCell.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    private func setupCell() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
    }
    
}
