//
//  TodoTableViewCell.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    // MARK: - UI구현
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let completedSwitch: UISwitch = {
        let swit = UISwitch()
        swit.isOn = true
        swit.translatesAutoresizingMaskIntoConstraints = false
        return swit
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 2
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private func setupStackView() {
        self.contentView.addSubview(completedSwitch)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: completedSwitch.leadingAnchor, constant: -10),
            
            completedSwitch.widthAnchor.constraint(equalToConstant: 60),
            completedSwitch.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            completedSwitch.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            completedSwitch.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    var task: Task?
    var isSeclected = true
    var viewModel: ViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setConstraints()
        self.completedSwitch.addTarget(self, action: #selector(switchedToggle(sender:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchedToggle(sender: UISwitch) {
        guard let viewModel = viewModel, let task = task else { return }

        isSeclected = sender.isOn
        task.isCompleted = isSeclected

        if isSeclected {
            titleLabel.attributedText = NSAttributedString(string: task.title ?? "")
        } else {
            titleLabel.attributedText = titleLabel.text?.strikeThrough()
        }
        print(isSeclected)
        viewModel.updateIsCompleted(task: task, isCompleted: isSeclected)
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
