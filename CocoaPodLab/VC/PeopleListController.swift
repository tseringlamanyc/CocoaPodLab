//
//  PeopleListController.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class PeopleListController: UIViewController {
    
    private let userView = UserVIew()
    
    override func loadView() {
        view = userView 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
    }
    
}
