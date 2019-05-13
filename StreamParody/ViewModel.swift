//
//  ViewModel.swift
//  StreamParody
//
//  Created by Oluwadamisi Pikuda on 11/05/2019.
//  Copyright © 2019 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import Foundation

protocol ViewModelProtocol {
    var cellSize: CGSize { get }
    var numberOfItems: Int { get }
    var users: [UserModel] { get }
    func getUserName(indexPath: IndexPath) -> ImageName.UserIcons
    func getUserNotification(indexPath: IndexPath) -> Int
    func getComments() -> [String: String]
}

struct ViewModel: ViewModelProtocol {
    let cellSize = CGSize(width: 70, height: 70)
    let users = [
        UserModel(userName: .user1, notification: 0),
        UserModel(userName: .user2, notification: 10),
        UserModel(userName: .user3, notification: 5),
        UserModel(userName: .user4, notification: 4),
        UserModel(userName: .user5, notification: 2),
        UserModel(userName: .user6, notification: 1),
        UserModel(userName: .user7, notification: 0),
        UserModel(userName: .user8, notification: 3),
        UserModel(userName: .user9, notification: 0),
        UserModel(userName: .user10, notification: 0)
    ]

    var numberOfItems: Int {
        return users.count
    }

    func getUserName(indexPath: IndexPath) -> ImageName.UserIcons {
        return users[indexPath.row].userName
    }

    func getUserNotification(indexPath: IndexPath) -> Int {
        return users[indexPath.row].notification
    }

    func getComments() -> [String: String] {
        return ["Corner": "kkbasid a isdugaid uaidg aiusgd iagd as",
                "Koby": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "Can": "asdjlas a kuaskd   adua dku  addf fd  d",
                "Pig4lyf": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "OkayBoy": "asdjlas a kuaskd   adua dku  addf fd  d",
                "meaner": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "Come on!": "asdjlas a kuaskd   adua dku  addf fd  d",
                "Lady": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "Oldie": "asdjlas a kuaskd   adua dku  addf fd  d",
                "Bee": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "Ole": "asdjlas a kuaskd   adua dku  addf fd  d",
                "Soldier": "akhsdgjahsgdkahgd as jdasgy das gdag ysdadsa",
                "Damn": "asdjlas a kuaskd   adua dku  addf fd  d"
        ]
    }
}
