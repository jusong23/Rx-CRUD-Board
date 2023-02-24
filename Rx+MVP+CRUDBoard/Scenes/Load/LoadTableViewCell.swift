//
//  LoadTableViewCell.swift
//  Tweet
//
//  Created by Eunyeong Kim on 2021/08/24.
//

import SnapKit
import UIKit

final class LoadTableViewCell: UITableViewCell {
    static let identifier = "LoadTableViewCell"

    var titleLabel = UILabel()
    var descriptionLabel = UILabel()

    // ✅
    func setup(listElemenet: ListElement) {
        selectionStyle = .none

        setupLayout()

        titleLabel.text = listElemenet.title
        descriptionLabel.text = listElemenet.description
    }
}

private extension LoadTableViewCell {
    func setupLayout() {
        [
            titleLabel, descriptionLabel
        ].forEach {
            contentView.addSubview($0)
        }

        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)

        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 1

        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(18)
            // superView의 안쪽 set을 18로 !
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
        }
    }
}
