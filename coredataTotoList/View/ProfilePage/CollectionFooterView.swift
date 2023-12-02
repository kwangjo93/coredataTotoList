//
//  CollectionFooterView.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/18.
//

import UIKit

final class CollectionFooterView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "folder"))
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
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 45),
            imageView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
