//
//  PeopleListController.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout

class PeopleListController: UIViewController {
    
    private let userView = UserVIew()
    
    private var allUsers = [Result1]() {
        didSet {
            userView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userView.collectionView.dataSource = self
        userView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
        getData()
    }
    
    private func getData() {
        UserClient.getUsers { [weak self](result) in
            switch result {
            case .failure(let error):
                print("no users: \(error)")
            case .success(let users):
                DispatchQueue.main.async {
                    self?.allUsers = users
                }
            }
        }
    }
    
}

extension PeopleListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError()
        }
        let aUser = allUsers[indexPath.row]
        cell.updateCell(user: aUser)
        cell.backgroundColor = .systemRed
        if let layout = collectionView.collectionViewLayout as? CollectionViewSlantedLayout {
            cell.contentView.transform = CGAffineTransform(rotationAngle: layout.slantingAngle)
        }
        return cell
    }
}

extension PeopleListController: CollectionViewDelegateSlantedLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("Did select item at indexPath: [\(indexPath.section)][\(indexPath.row)]")
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: CollectionViewSlantedLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(1000)
    }
}

//extension PeopleListController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let maxSize = UIScreen.main.bounds.size
//        let itemWidth: CGFloat = maxSize.width
//        return CGSize(width: itemWidth, height: 464)
//    }
//}

