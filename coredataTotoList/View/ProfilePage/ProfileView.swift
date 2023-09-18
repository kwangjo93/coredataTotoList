//
//  ProfileView.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/18.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - UI구현
    //상단 바
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        button.frame.size.height = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.text = "Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "text.justify"), for: .normal)
        button.tintColor = .black
        button.frame.size.height = 15
        button.frame.size.width = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [backButton, titleLabel, menuButton])
        sv.axis = .horizontal
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 100
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //My Status Line
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Ellipse 1")
        imageView.clipsToBounds = true
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let postNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "7"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "post"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [postNumberLabel, postTextLabel])
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 3
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let followrNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followrTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "follower"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followrNumberLabel, followrTextLabel])
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 3
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let followingNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followingTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "following"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followingStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followingNumberLabel, followingTextLabel])
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 3
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    //detail profile
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "르탄이"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "iOS Developer 🍎"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userBlogLinkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .blue
        label.text = "spartacodingclub.kr"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var detailProfilestackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [userNameLabel ,userDescriptionLabel, userBlogLinkLabel])
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 3
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //버튼 구성
    let followButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.5960784314, blue: 0.9529411765, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 2.0
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 5
//        button.frame.size.height = 40
//        button.frame.size.width = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonFillEqually: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followButton ,messageButton])
        sv.axis = .horizontal
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [buttonFillEqually, moreButton])
        sv.axis = .horizontal
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //하단 그리드 버튼
    let gridImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Grid")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageContainView: UIView = {
        let view = UIView()
        view.addSubview(gridImage)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupAddsubStackView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupAddsubStackView() {
        self.addSubview(titleStackView)
        self.addSubview(profileImageView)
        self.addSubview(postStackView)
        self.addSubview(followStackView)
        self.addSubview(followingStackView)
        self.addSubview(detailProfilestackView)
        self.addSubview(buttonStackView)
        self.addSubview(imageContainView)
    }
    
    // MARK: - 오토레이아웃
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: titleStackView.topAnchor, constant: 40),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            postTextLabel.centerXAnchor.constraint(equalTo: postNumberLabel.centerXAnchor),
            postStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -65),
            postStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -10),
            
            followrTextLabel.centerXAnchor.constraint(equalTo: followrNumberLabel.centerXAnchor),
            followStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -65),
            followStackView.leadingAnchor.constraint(equalTo: postStackView.trailingAnchor, constant:-5),
            
            followingStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -65),
            followingTextLabel.centerXAnchor.constraint(equalTo: followingNumberLabel.centerXAnchor),
            followingStackView.leadingAnchor.constraint(equalTo: postStackView.trailingAnchor, constant: 80),
            followingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            detailProfilestackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 14),
            detailProfilestackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            detailProfilestackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
        ])
        
                NSLayoutConstraint.activate([
                    buttonStackView.topAnchor.constraint(equalTo: detailProfilestackView.bottomAnchor, constant: 11),
                    buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
                    buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
                    moreButton.widthAnchor.constraint(equalToConstant: 35),
                    moreButton.heightAnchor.constraint(equalToConstant: 35)
                ])
        
                NSLayoutConstraint.activate([
                    imageContainView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 11),
                    imageContainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                    imageContainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                    imageContainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        
                    gridImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
                    gridImage.topAnchor.constraint(equalTo: imageContainView.topAnchor, constant: 10),
                    gridImage.bottomAnchor.constraint(equalTo: imageContainView.bottomAnchor, constant: -10)
                ])
        
    }
}
