//
//  MainView.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//
import UIKit

final class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let todoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let completedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("완료한 일 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let profileButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Profile 보기(ProfileDesignViewController)", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    
    
    private func setupStackView() {
        self.addSubview(mainImageView)
        stackView.addArrangedSubview(todoButton)
        stackView.addArrangedSubview(completedButton)
        stackView.addArrangedSubview(profileButton)
        // 뷰컨트롤러의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
    }
    
    
    // MARK: - 오토레이아웃

       private func setConstraints() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                mainImageView.heightAnchor.constraint(equalToConstant: 120),
                mainImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
                mainImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
                mainImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
                
                stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
                stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
                stackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 40),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300)
       
            ])
        }
    }


