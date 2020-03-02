//
//  DetailVC.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    private var detailView = DetailView()
    
    public var user: Result1!
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        detailView.setUp(user: user)
    }
  
}
