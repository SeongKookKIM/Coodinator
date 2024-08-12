//
//  ViewController.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit
import SnapKit
import Combine

class TodoListViewController: UIViewController {
    
    var coordinator: TodoListCoordinator?
    var todoListViewModel = TodoListVewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // tableView
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: "todoListCell")
        
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        self.view.backgroundColor = .systemBackground
        
        setupUI()
        setupTapBar()
        setupBindingData()
    }

    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        tableView.snp.makeConstraints { [weak self] table in
            guard let self = self else { return }
            table.top.equalTo(safeArea.snp.top)
            table.right.equalTo(safeArea.snp.right)
            table.bottom.equalTo(safeArea.snp.bottom)
            table.left.equalTo(safeArea.snp.left)
        }
    }
    
    private func setupTapBar() {
        let addButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = .systemBlue
        
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        coordinator?.addTodo()
    }
    
    private func setupBindingData() {
        todoListViewModel.$todoList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListViewModel.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as! TodoListTableViewCell
        
        let todoList = todoListViewModel.todoList[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(item: todoList)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoItem = todoListViewModel.todoList[indexPath.row]
        coordinator?.moveDetail(for: todoItem)

    }
    
}



