//
//  NewToDoTableViewCell.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class NewToDoTableViewCell: UITableViewCell {
    static let identifier = "cellid"
    
    private let todoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super .init(style: style,
                    reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with textLabel: String) {
        todoLabel.text = textLabel
    }
    
    private func layout() {
        contentView.addSubview(todoLabel)
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            todoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
