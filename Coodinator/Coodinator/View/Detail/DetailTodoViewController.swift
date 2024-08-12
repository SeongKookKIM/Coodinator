//
//  DetailTodoViewController.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

class DetailTodoViewController: UIViewController {
    var viewModel: DetailTodoViewModel!
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let contentlabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        self.view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(contentlabel)
        
        setupBindingData()
        setupLayout()
    }
    
    private func setupBindingData() {
        titleLabel.text = viewModel.todoItem.title
        contentlabel.text = viewModel.todoItem.content
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { [weak self] label in
            guard let self = self else { return }
            label.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            label.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
        }
        
        contentlabel.snp.makeConstraints { [weak self] label in
            guard let self = self else { return }
            label.top.equalTo(titleLabel.snp.bottom).offset(20)
            label.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
        }
    }
}
