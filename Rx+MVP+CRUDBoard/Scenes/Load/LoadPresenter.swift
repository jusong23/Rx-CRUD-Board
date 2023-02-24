//
//  LoadPresenter.swift
//  Tweet
//
//  Created by Eunyeong Kim on 2021/08/24.
//

import UIKit

protocol LoadProtocol: AnyObject {
    func setupView()
    func reloadTableView()
//    func moveToTweetViewController(with tweet: Tweet)
//    func moveToWriteViewController()
}

final class LoadPresenter: NSObject {
    private weak var viewController: LoadProtocol?

    private var listElement: [ListElement] = []

    init(
        viewController: LoadProtocol
    ) {
        self.viewController = viewController
    }

    func viewDidLoad() {
        viewController?.setupView()
    }

    func viewWillAppear() {
        viewController?.reloadTableView()
    }

//    func didTapWriteButton() {
//        viewController?.moveToWriteViewController()
//    }
}

extension LoadPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tweets.count
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LoadTableViewCell.identifier,
            for: indexPath
        ) as? LoadTableViewCell

//        let listElement = listElement[indexPath.row]
//        cell?.setup(listElemenet: listElement)

        cell?.titleLabel.text = "titleLabel"
        cell?.descriptionLabel.text = "description"
        return cell ?? UITableViewCell()
    }
}

//extension FeedPresenter: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let tweet = tweets[indexPath.row]
//        viewController?.moveToTweetViewController(with: tweet)
//    }
//}
