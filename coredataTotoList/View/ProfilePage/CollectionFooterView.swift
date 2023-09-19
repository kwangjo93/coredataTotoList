//
//  CollectionFooterView.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/18.
//

import UIKit

class CollectionFooterView: UICollectionReusableView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 175),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -175),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -43)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
