//
//  ViewController.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let profileBannerView = ProfileBannerView()
    private var collectionView: UICollectionView?
    private let collectionViewSpace = UIView()
    private let cellIdentifier = "cell"
    private let viewModel: ViewModelProtocol = ViewModel()
    private let videoViewController = VideoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViews()
        addObservers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileBannerView.pulse()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: viewModel.cellSize.width, height: viewModel.cellSize.height)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5

        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionView?.backgroundColor = UIColor.Stream.primary

        collectionView?.dataSource = self
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)

        view.addSubview(collectionViewSpace)
        collectionViewSpace.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }

        guard let collectionView = collectionView else { return }
        collectionViewSpace.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(collectionViewSpace)
        }
    }

    func setupViews() {
        let commentsView = CommentsView(comments: viewModel.getComments())
        view.backgroundColor = UIColor.Stream.primary
        view.addSubviews([commentsView, profileBannerView])

        profileBannerView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(90)
        }

        commentsView.snp.makeConstraints { (make) in
            make.bottom.equalTo(profileBannerView.snp.top)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }

        addChild(videoViewController)
        videoViewController.didMove(toParent: self)
        view.addSubview(videoViewController.view)

        videoViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView!.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(commentsView.snp.top)
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
        profileBannerView.pulse()
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
            as? CollectionViewCell else { return UICollectionViewCell() }

        cell.removeAllSubViews()

        cell.bindData(imageName: viewModel.getUserName(indexPath: indexPath),
                      notifications: viewModel.getUserNotification(indexPath: indexPath))

        return cell
    }


}
