//
//  TabBarViewController.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    let tabBarItemImageInsets = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let playVC = ViewController()

        let playIcon = UIImage(named: ImageName.play.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)
        let selectedPlay = UIImage(named: ImageName.playFilled.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)

        let playItem = UITabBarItem(title: nil, image: playIcon, selectedImage: selectedPlay)
        playVC.tabBarItem = playItem

        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .purple

        let searchIcon = UIImage(named: ImageName.search.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)
        let selectedSearch = UIImage(named: ImageName.searchFilled.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)

        let searchItem = UITabBarItem(title: nil, image: searchIcon, selectedImage: selectedSearch)
        searchVC.tabBarItem = searchItem

        let notificationVC = UIViewController()
        notificationVC.view.backgroundColor = .red

        let notificationIcon = UIImage(named: ImageName.bell.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)
        let selectedNotification = UIImage(named: ImageName.bellFilled.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)

        let notificationItem = UITabBarItem(title: nil, image: notificationIcon, selectedImage: selectedNotification)
        notificationVC.tabBarItem = notificationItem

        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue

        let profileIcon = UIImage(named: ImageName.user.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)
        let selectedProfile = UIImage(named: ImageName.userFilled.rawValue)?.withAlignmentRectInsets(tabBarItemImageInsets)

        let profileItem = UITabBarItem(title: nil, image: profileIcon, selectedImage: selectedProfile)
        profileVC.tabBarItem = profileItem

        self.viewControllers = [playVC, searchVC, notificationVC, profileVC]

        styleTabBar()
//        setTabBarTextAttributes()
    }

    private func styleTabBar() {
        UITabBar.appearance().barTintColor = UIColor.Stream.primary
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().layer.borderWidth = 0
        UITabBar.appearance().clipsToBounds = true
    }
}
