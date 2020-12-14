//
//  PostViewController.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 05.12.2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PostViewController: UIViewController, AutoLoadable {
    var viewModel: PostViewModel!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: CommentTableViewCell.reusedId, bundle: nil),
                           forCellReuseIdentifier: CommentTableViewCell.reusedId)
        
        viewModel.post.drive(onNext: { [weak self] in
            guard let self = self else { return }
            self.titleLabel.text = $0.title
            self.postLabel.text = $0.body
        }).disposed(by: disposeBag)
        
        viewModel.author.subscribe(onNext: { [weak self] author in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.authorLabel.text = author.username
            }
        }).disposed(by: disposeBag)
        
        viewModel.commentsSequence.bind(to: tableView
                                            .rx.items(cellIdentifier: CommentTableViewCell.reusedId)) { row, comment, cell in
            (cell as! CommentTableViewCell).setupCell(title: comment.name, email: comment.email, comment: comment.body)
            cell.selectionStyle = .none
        }.disposed(by: disposeBag)
    }
}

