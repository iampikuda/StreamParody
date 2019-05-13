//
//  CollectionViewCell.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let profileView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        return view
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Stream.greyer
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let nofiticationView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = UIColor.red
        view.clipsToBounds = true
        return view
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        nofiticationView.isHidden = false
        profileImageView.image = nil
        contentView.removeAllSubViews()
    }

    func bindData(imageName: ImageName.UserIcons, notifications: Int) {
        setupViews()
        setupImageAndLabel(imageName: imageName, notifications: notifications)
    }

    func setupImageAndLabel(imageName: ImageName.UserIcons, notifications: Int) {
        profileImageView.image = UIImage(named: imageName.rawValue)
        userNameLabel.text = imageName.rawValue
        if notifications == 0 {
            nofiticationView.isHidden = true
        } else {
            numberLabel.text = "\(notifications)"
            nofiticationView.isHidden = false
        }
    }

    func setupViews() {
        addSubviews([profileView, nofiticationView, userNameLabel])
        profileView.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }

        nofiticationView.snp.makeConstraints { (make) in
            make.top.right.equalTo(profileView)
            make.width.height.equalTo(14)
        }

        profileView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        nofiticationView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.8)
            make.centerY.centerX.equalToSuperview()
        }

        userNameLabel.snp.makeConstraints { (make) in
            make.bottom.centerX.left.right.equalToSuperview()
            make.top.equalTo(profileView.snp.bottom).offset(10)
        }
    }
}
