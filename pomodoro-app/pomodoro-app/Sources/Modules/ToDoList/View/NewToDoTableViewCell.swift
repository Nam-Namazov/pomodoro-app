//
//  NewToDoTableViewCell.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class NewToDoTableViewCell: UITableViewCell {
    static let identifier = "cellid"
    
    var onDelete: (() -> Void)?
    
    private let todoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let markDonebutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        checkMarkButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        markDonebutton.isSelected = false
    }
    
    func configure(with textLabel: String) {
        todoLabel.text = textLabel
    }
    
    private func checkMarkButtonTapped() {
        markDonebutton.addTarget(self, action: #selector(handleMarkButton), for: .touchUpInside)
    }
    
    private func layout() {
        contentView.addSubview(markDonebutton)
        contentView.addSubview(todoLabel)
        
        markDonebutton.translatesAutoresizingMaskIntoConstraints = false
        todoLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            markDonebutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            markDonebutton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            todoLabel.leadingAnchor.constraint(equalTo: markDonebutton.trailingAnchor, constant: 10),
            todoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            todoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            todoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    @objc private func handleMarkButton() {
        markDonebutton.isSelected = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.onDelete?()
        }
    }
}
