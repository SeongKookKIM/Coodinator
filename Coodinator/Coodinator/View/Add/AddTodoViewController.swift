//
//  AddTodoViewController.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    var coordinator: AddTodoCoordinator?
    var todoListViewModel = TodoListVewModel()
    
    private let titleTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.attributedPlaceholder = NSAttributedString(
            string: "타이틀 입력.",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
        )
        textField.borderStyle = .roundedRect
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: 0.0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let contentTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.attributedPlaceholder = NSAttributedString(
            string: "내용 입력.",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
        )
        textField.borderStyle = .roundedRect
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: 0.0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let submitBtn: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.title = "추가"
        config.baseBackgroundColor = .blue
        config.baseForegroundColor = .systemBackground
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        
        button.configuration = config
        button.alpha = 0.5
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let cancelBtn: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        config.title = "취소"
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .systemBackground
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        
        button.configuration = config
        button.alpha = 0.5
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(titleTF)
        self.view.addSubview(contentTF)
        self.view.addSubview(submitBtn)
        self.view.addSubview(cancelBtn)
        
        
        titleTF.snp.makeConstraints { [weak self] tf in
            guard let self = self else { return }
            tf.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            tf.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            tf.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
        
        contentTF.snp.makeConstraints { [weak self] tf in
            guard let self = self else { return }
            tf.top.equalTo(titleTF.snp.bottom).offset(20)
            tf.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            tf.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
        
        submitBtn.snp.makeConstraints { [weak self] btn in
            guard let self = self else { return }
            btn.top.equalTo(contentTF.snp.bottom).offset(50)
            btn.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            btn.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
        
        cancelBtn.snp.makeConstraints { [weak self] btn in
            guard let self = self else { return }
            btn.top.equalTo(submitBtn.snp.bottom).offset(20)
            btn.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
            btn.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
    }
    
    private func setupActions() {
        submitBtn.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.todoListViewModel.addTodoList(item: TodoListModel(id: UUID(), title: self.titleTF.text ?? "", content: self.contentTF.text ?? ""))
            
            self.coordinator?.dismiss()
        }, for: .touchUpInside)
        
        cancelBtn.addAction(UIAction { [weak self] _ in
            self?.coordinator?.dismiss()
        }, for: .touchUpInside)
    }
}
