//
//  StartViewController.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ListOfPostsViewController: UIViewController, AutoLoadable {
    var viewModel: ListOfPostsViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: PostPreviewTableViewCell.reusedId, bundle: nil),
                           forCellReuseIdentifier: PostPreviewTableViewCell.reusedId)
        
        tableView.reloadData()
        
        viewModel.postsSequence.bind(to: tableView.rx.items(cellIdentifier: PostPreviewTableViewCell.reusedId)) { row, post, cell in
            (cell as! PostPreviewTableViewCell)
                .setupCell(title: post.title,
                           postPreview: post.body,
                           author: nil)
            cell.selectionStyle = .none
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Post.self).subscribe(onNext: { [weak self] element in
            guard let self = self else { return }
            self.viewModel.didTapCell(with: element)
        }).disposed(by: disposeBag)
    }
}
