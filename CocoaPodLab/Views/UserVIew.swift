//
//  UserVIew.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import SnapKit
import CollectionViewSlantedLayout

class UserVIew: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let slantedSayout = CollectionViewSlantedLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: slantedSayout)
        cv.backgroundColor = .black
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCV()
    }
    
    private func setupCV() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
}
