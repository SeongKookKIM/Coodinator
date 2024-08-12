//
//  TodoListTableViewCell.swift
//  Coodinator
//
//  Created by SeongKook on 8/12/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentLabel)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { [weak self] label in
            guard let self = self else { return }
            label.top.equalTo(self.contentView.snp.top).offset(10)
            label.left.equalTo(self.contentView.snp.left).offset(10)
        }
        
        contentLabel.snp.makeConstraints { [weak self] label in
            guard let self = self else { return }
            label.top.equalTo(titleLabel.snp.bottom).offset(10)
            label.left.equalTo(self.contentView.snp.left).offset(10)
            label.right.equalTo(self.contentView.snp.right).offset(-10) 
            label.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }

    func configure(item: TodoListModel) {
        titleLabel.text = item.title
        contentLabel.text = item.content
    }
}
