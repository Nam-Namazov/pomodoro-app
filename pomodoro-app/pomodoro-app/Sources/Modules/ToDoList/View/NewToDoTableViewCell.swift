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

    private let todoLabel = Utilis().labelBold(with: nil,
                                               font: 15,
                                               numberOfLines: 0,
                                               textColor: .black)
    
    private let dataLabel = Utilis().labelStandard(with: nil,
                                                   font: 13,
                                                   numberOfLines: 1,
                                                   textColor: .gray)
    
    private let markDonebutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
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
    
    func configure(with textLabel: String, time: String) {
        todoLabel.text = textLabel
        dataLabel.text = time
    }
    
    private func checkMarkButtonTapped() {
        markDonebutton.addTarget(self, action: #selector(handleMarkButton), for: .touchUpInside)
    }
    
    private func layout() {
        contentView.addSubview(markDonebutton)
        contentView.addSubview(todoLabel)
        contentView.addSubview(dataLabel)
        
        markDonebutton.translatesAutoresizingMaskIntoConstraints = false
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            markDonebutton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            markDonebutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            todoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            todoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            todoLabel.widthAnchor.constraint(equalToConstant: 250),
            todoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    @objc private func handleMarkButton() {
        markDonebutton.isSelected = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.onDelete?()
        }
    }
}
