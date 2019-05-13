//
//  ProfileBannerView.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import SnapKit

class ProfileBannerView: UIView {

    let profileView = UIView()
    let userNameView = UIView()
    let shareView = UIView()
    let messageView = UIView()
    let starView = UIView()
    let pulsatingLayer = CAShapeLayer()
    let secondPulsatingLayer = CAShapeLayer()
    let floatingLayer = CAShapeLayer()

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: ImageName.UserIcons.user1.rawValue)
        return imageView
    }()

    private let addImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: ImageName.plus.rawValue)
        return imageView
    }()

    private let userName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Pig"
        return label
    }()

    private let userFollowersLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Stream.greyer
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "8.9k Followers"
        return label
    }()

    private let verifiedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageName.verified.rawValue)
        return imageView
    }()

    private let shareImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageName.share.rawValue)
        return imageView
    }()

    private let messageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageName.message.rawValue)
        return imageView
    }()

    private let starImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageName.circledStar.rawValue)
        return imageView
    }()

    private let shareLabel: UILabel = {
        let label = UILabel()
        label.text = "Share"
        label.textColor = UIColor.Stream.greyer
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "102"
        label.textColor = UIColor.Stream.greyer
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()

    private var numberOfStars: Int {
        willSet {
            starLabel.text = "\(newValue)"
        }
    }

    private let starLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textColor = UIColor.Stream.orangy
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()

    init() {
        numberOfStars = 12
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setupProfileView()
        setupUserNameView()
        setupShareView()
        setupMessageView()
        setupStarView()
    }
    func setupShareView() {
        addSubview(shareView)
        shareView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalTo(userNameView.snp.right).offset(10)
        }

        shareView.addSubviews([shareImageView, shareLabel])
        shareImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        shareLabel.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(shareImageView.snp.bottom).offset(2)
        }
    }

    func setupMessageView() {
        addSubview(messageView)
        messageView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalTo(shareView.snp.right).offset(10)
        }

        messageView.addSubviews([messageImageView, messageLabel])
        messageImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        messageLabel.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(messageImageView.snp.bottom).offset(2)
        }
    }

    func setupStarView() {
        addSubview(starView)
        starView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(messageView.snp.right).offset(10)
        }

        starView.addSubviews([starImageView, starLabel])
        starImageView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.height.width.equalTo(45)
        }

        starLabel.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(starImageView.snp.bottom).offset(2)
        }

        starImageView.layer.cornerRadius = 22.5
    }

    func setupProfileView() {
        addSubview(profileView)
        profileView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(10)
            make.width.height.equalTo(60)
            make.centerY.equalToSuperview()
        }

        profileView.addSubviews([profileImageView, addImageView])
        profileImageView.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalToSuperview()
        }

        addImageView.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.height.width.equalTo(24)
        }
    }

    func setupUserNameView() {
        addSubview(userNameView)
        userNameView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerY.equalToSuperview()
            make.left.equalTo(profileView.snp.right).offset(5)
        }

        userNameView.addSubviews([userName, verifiedImageView, userFollowersLabel])
        userName.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        userFollowersLabel.snp.makeConstraints { (make) in
            make.bottom.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        verifiedImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(userName.snp.centerY)
            make.left.equalTo(userName.snp.right).offset(8)
            make.right.lessThanOrEqualToSuperview()
            make.height.equalTo(userName).multipliedBy(0.6)
        }
    }

    func pulse() {
        pulsatingLayer.path = UIBezierPath(
            arcCenter: .zero,
            radius: 22.5,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        ).cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 0
        pulsatingLayer.fillColor = UIColor.Stream.orangy.withAlphaComponent(0.5).cgColor
        pulsatingLayer.lineCap = CAShapeLayerLineCap.round
        pulsatingLayer.position = CGPoint(x: starImageView.bounds.midX, y: starImageView.bounds.midY)
        pulsatingLayer.zPosition = 999
        starImageView.layer.addSublayer(pulsatingLayer)

        secondPulsatingLayer.path = UIBezierPath(
            arcCenter: .zero,
            radius: 22.5,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
            ).cgPath
        secondPulsatingLayer.strokeColor = UIColor.clear.cgColor
        secondPulsatingLayer.lineWidth = 0
        secondPulsatingLayer.fillColor = UIColor.Stream.orangy.withAlphaComponent(0.5).cgColor
        secondPulsatingLayer.lineCap = CAShapeLayerLineCap.round
        secondPulsatingLayer.position = CGPoint(x: starImageView.bounds.midX, y: starImageView.bounds.midY)
        secondPulsatingLayer.zPosition = 9999
        starImageView.layer.addSublayer(secondPulsatingLayer)

        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.toValue = 7
        transformAnimation.fromValue = 1

        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.toValue = 0.1
        fadeAnimation.fromValue = 1

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, fadeAnimation]
        animationGroup.duration = 0.5
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.repeatCount = Float.infinity

        let animationGroup2 = CAAnimationGroup()
        animationGroup2.animations = [transformAnimation, fadeAnimation]
        animationGroup2.duration = 0.5
        animationGroup2.isRemovedOnCompletion = false
        animationGroup2.fillMode = CAMediaTimingFillMode.forwards
        animationGroup2.repeatCount = Float.infinity

        let animationGroup3 = CAAnimationGroup()
        animationGroup3.animations = [transformAnimation, fadeAnimation]
        animationGroup3.duration = 0.5
        animationGroup3.isRemovedOnCompletion = false
        animationGroup3.fillMode = CAMediaTimingFillMode.forwards
        animationGroup3.repeatCount = Float.infinity

        pulsatingLayer.add(animationGroup, forKey: "pulsingFade")


        DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
            self.secondPulsatingLayer.add(animationGroup2, forKey: "pulsingFade2")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.32) {
            self.secondPulsatingLayer.add(animationGroup3, forKey: "pulsingFade3")
            self.pulseNumbers()
        }
    }

    func pulseNumbers() {
        for number in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(number * 300)) {
                let numberPulseLayer = CATextLayer()
                numberPulseLayer.foregroundColor = UIColor.random.cgColor
                numberPulseLayer.string = "+\(number)"
                let starImageViewBounds = self.starImageView.layer.bounds
                numberPulseLayer.frame = CGRect(
                    x: .random(in: -5...5) * 5.0,
                    y: 0,
                    width: starImageViewBounds.width,
                    height: starImageViewBounds.height
                )
                numberPulseLayer.zPosition = 99999
                self.starImageView.layer.addSublayer(numberPulseLayer)

                let transformAnimation = CABasicAnimation(keyPath: "transform.translation.y")
                transformAnimation.toValue = -300
                transformAnimation.fromValue = 1

                let fadeAnimation = CABasicAnimation(keyPath: "opacity")
                fadeAnimation.toValue = 0.3
                fadeAnimation.fromValue = 1

                let animationGroup = CAAnimationGroup()
                animationGroup.animations = [transformAnimation, fadeAnimation]
                animationGroup.duration = 1
                animationGroup.isRemovedOnCompletion = false
                animationGroup.fillMode = CAMediaTimingFillMode.forwards
                animationGroup.repeatCount = 1

                numberPulseLayer.add(animationGroup, forKey: "number\(number)")
                self.numberOfStars += 1
            }
        }
    }
}
