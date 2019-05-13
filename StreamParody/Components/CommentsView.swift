//
//  CommentsView.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 12/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation
import UIKit

class CommentsView: UIView {
    let comments: [String: String]

    private let commentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    private let commentsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    private let overlay: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Stream.primary.withAlphaComponent(0.5)
        view.isUserInteractionEnabled = false
        return view
    }()

    init(comments: [String: String]) {
        self.comments = comments
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setupStackView()
        addSubviews([commentsScrollView, overlay])
        commentsScrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        commentsScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        contentView.addSubview(commentsStackView)
        commentsStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(self)
        }

        overlay.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }

    func setupStackView() {
        for (name, comment) in comments {
            let label = UILabel()
            let text = NSMutableAttributedString().withAttributes(
                text: name,
                textColor: .white,
                font: UIFont.boldSystemFont(ofSize: 17)
            )
            text.appendStringWithAttributes(
                text: "   " + comment,
                textColor: .white,
                font: UIFont.systemFont(ofSize: 13)
            )

            label.attributedText = text
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5

            commentsStackView.addArrangedSubviews([label])
        }
    }
}
