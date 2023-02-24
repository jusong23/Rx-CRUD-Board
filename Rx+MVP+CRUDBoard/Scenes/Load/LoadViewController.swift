//
//  LoadViewController.swift
//  Rx+MVP+CRUDBoard
//
//  Created by mobile on 2023/02/24.
//

import Floaty
import UIKit
import SnapKit

final class LoadViewController: UIViewController {
    
    private lazy var writeButton: Floaty = {
        let float = Floaty(size: 50.0)
        float.sticky = true
        float.handleFirstItemDirectly = true
        float.addItem(title: "") { [weak self] _ in
            print("Floaty !")
        }

        float.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)

        return float
    }()
    
    private lazy var presenter = LoadPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
//        tableView.delegate = presenter
        tableView.dataSource = presenter

        tableView.register(
            LoadTableViewCell.self,
            forCellReuseIdentifier: LoadTableViewCell.identifier
        )

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.viewWillAppear()
    }


    func reloadTableView() {
        tableView.reloadData()
    }
    
//    func moveToWriteViewController() {
//        let writeViewController = UINavigationController(rootViewController: WriteViewController())
//        writeViewController.modalPresentationStyle = .fullScreen
//
//        present(writeViewController, animated: true)
//    }
    
}

extension LoadViewController: LoadProtocol {
    func setupView() {
        navigationItem.title = "Load"

        [tableView, writeButton].forEach {
            view.addSubview($0)
        }

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        writeButton.paddingY = tabBarItem.accessibilityFrame.height + 100
    }

//    func moveToTweetViewController(with tweet: Tweet) {
//        let tweetViewController = TweetViewController(tweet: tweet)
//        navigationController?.pushViewController(tweetViewController, animated: true)
//    }
}
