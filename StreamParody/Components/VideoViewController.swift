//
//  VideoViewController.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 12/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoViewController: UIViewController {

    private let videoTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()

    private let advertStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()

    private let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.more.rawValue)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.chevronRight.rawValue)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let starButton: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Stream.orangy.withAlphaComponent(0.1)
        return view
    }()

    private let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.Star.rawValue)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let starLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Stream.orangy
        label.text = "1.3k"
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let advertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()

    private var videoPlayerNotification: NSObjectProtocol?
    private let videoView = UIView()
    var videoPlayer: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var playerController: AVPlayerViewController?
    private var isVisible = true

    private let clipURL: URL? = Bundle.main.url(forResource: "IntroClip", withExtension: "mp4")

    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
        setupPlayer()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isVisible = true

        guard let player = videoPlayer else { return }

        if player.timeControlStatus == .paused {
            player.play()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        videoPlayer?.pause()
        isVisible = false
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPlayer() {
        guard let url = clipURL else { return }

        let playerItem = AVPlayerItem(url: url)
        self.playerController = AVPlayerViewController()
        self.playerController?.player = AVPlayer()
        self.playerController?.exitsFullScreenWhenPlaybackEnds = true
        self.videoPlayer = self.playerController?.player
        videoPlayer?.play()
        videoPlayer?.isMuted = true
        videoPlayer?.replaceCurrentItem(with: playerItem)
        self.addChild(self.playerController!)
        self.videoView.addSubview((self.playerController?.view)!)
        self.playerController?.view.frame = self.videoView.bounds
        self.playerController?.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.playerController?.didMove(toParent: self)

        videoPlayerNotification = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: self.videoPlayer?.currentItem,
            queue: .main
        ) { [weak self] _ in
            self?.videoPlayer?.seek(to: CMTime.zero)
            self?.videoPlayer?.play()
        }
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handleWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    @objc private func handleWillEnterForeground() {
        guard let player = videoPlayer else { return }

        if player.timeControlStatus == .paused && isVisible {
            player.play()
        }
    }

    func setupViews() {
        setupVideoTitleView()
        setupAdvertView()
        view.addSubviews([videoTitleView, videoView, advertView])
        videoTitleView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(70)
        }

        videoView.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()

            make.top.equalTo(videoTitleView.snp.bottom)
            make.bottom.equalTo(advertView.snp.top)
        }

        advertView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
    }

    func setupAdvertView() {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
        title.text = "#12 in Today's Top Clip Contest"

        let subtitle = UILabel()
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 14)
        subtitle.adjustsFontSizeToFitWidth = true
        subtitle.minimumScaleFactor = 0.5
        let text = NSMutableAttributedString().withAttributes(
            text: "$1k Prize Pool",
            textColor: UIColor.Stream.orangy,
            font: UIFont.systemFont(ofSize: 14)
        )
        text.appendStringWithAttributes(
            text: "  3h 45m 32s  1029 Entries",
            textColor: UIColor.white.withAlphaComponent(0.6),
            font: UIFont.systemFont(ofSize: 14)
        )
        subtitle.attributedText = text

        advertStackView.addArrangedSubviews([title, subtitle])
        advertView.addSubviews([advertStackView, chevronImageView])
        advertStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.right.equalTo(chevronImageView.snp.left)
        }

        chevronImageView.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }
    }

    func setupVideoTitleView() {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .left
        title.minimumScaleFactor = 0.5
        title.text = "NYC was fun but I'm back!"

        let subtitle = UILabel()
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 14)
        subtitle.textAlignment = .left
        subtitle.adjustsFontSizeToFitWidth = true
        subtitle.minimumScaleFactor = 0.5
        subtitle.text = "   32.1k views  Jinjuh clipped 5h ago"

        let moreView = UIView()
        moreView.addSubview(moreImageView)
        moreImageView.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(20)
        }

        titleStackView.addArrangedSubviews([title, subtitle])
        videoTitleView.addSubviews([titleStackView, moreView, starButton])
        titleStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.6)
        }

        moreView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(titleStackView.snp.right)
            make.width.equalToSuperview().multipliedBy(0.15)
        }

        starButton.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.left.equalTo(moreView.snp.right).offset(10)
            make.width.equalTo(70)
        }

        starButton.addSubviews([starImage, starLabel])
        starImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(starImage.snp.height)
            make.left.equalToSuperview().inset(10)
        }

        starLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.right.equalToSuperview().inset(5)
            make.left.equalTo(starImage.snp.right).offset(5)
        }

        starButton.layer.cornerRadius = 5
    }
}
