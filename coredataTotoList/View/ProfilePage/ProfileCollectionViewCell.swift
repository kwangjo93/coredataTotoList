//
//  ProfileCollectionViewCell.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    
    var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCell()
        self.addSubview(mainImageView)
        autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    private func setupCell() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func autolayout() {
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
