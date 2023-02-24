//
//  Icon.swift
//  Tweet
//
//  Created by Eunyeong Kim on 2021/08/25.
//

import UIKit

// 여기서 쓰진 않지만 있으면 좋아서 가져옴

enum Icon: CaseIterable {
    case message
    case share
    case like
    case write

    var image: UIImage? {
        let systemName: String

        switch self {
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .like: systemName = "heart"
        case .write: systemName = "square.and.pencil"
        }

        return UIImage(systemName: systemName)
    }
}
