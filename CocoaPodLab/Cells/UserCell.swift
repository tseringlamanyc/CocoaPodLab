//
//  UserCell.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout
import SnapKit
import Kingfisher

let yOffsetSpeed: CGFloat = 150.0
let xOffsetSpeed: CGFloat = 100.0

class UserCell: CollectionViewSlantedCell {
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    public lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
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
        setupImage()
        setupLabel()
    }
    
    private func setupImage() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self)
        }
    }
    
    private func setupLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide).inset(40)
        }
    }
    
    func offset(_ offset: CGPoint) {
        userImage.frame = userImage.bounds.offsetBy(dx: offset.x, dy: offset.y)
    }
    
    public func updateCell(user: Result1) {
        guard let imageURL = URL(string: user.picture.large) else {
            return
        }
        userImage.kf.setImage(with: imageURL)
        nameLabel.text = user.name.first + user.name.last
        
    }
    
}
