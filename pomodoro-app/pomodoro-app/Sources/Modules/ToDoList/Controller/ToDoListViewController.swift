//
//  ToDoListViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit
import RealmSwift

final class ToDoListViewController: UIViewController {
    var list: [ToDo] {
        RealmManager.shared.toDoList
    }
    
    private let searchBarController = UISearchController()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"),
                        for: .normal)
        button.layer.cornerRadius = 55 / 2
        return button
    }()
    
    private let todoListTableView: UITableView = {
        let tableview = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableview.register(NewToDoTableViewCell.self,
                           forCellReuseIdentifier: NewToDoTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
        configureDelegate()
        actionAddButton()
    }

    private func style() {
        view.backgroundColor = .white
        title = navigationController?.title
        navigationItem.searchController = searchBarController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func configureDelegate() {
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
    }
    
    private func actionAddButton() {
        addButton.addTarget(self,
                            action: #selector(handleAddButton),
                            for: .touchUpInside)
    }
    
    private func setup() {
        view.addSubview(todoListTableView)
        view.addSubview(addButton)
        
        todoListTableView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            todoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            addButton.heightAnchor.constraint(equalToConstant: 55),
            addButton.widthAnchor.constraint(equalToConstant: 55)
        ])
    }

    @objc private func handleAddButton() {
        let vc = AddNewToDoViewController()
        vc.onDismiss = { [weak self] in
            self?.todoListTableView.reloadData()
        }
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewToDoTableViewCell.identifier,
            for: indexPath) as? NewToDoTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: list[indexPath.row].textToDo)

        return cell
    }
}

// MARK: - UITableViewDelegate
extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
