//
//  BaseCollectionPage.swift
//  ProgrammaticUI-3
//
//  Created by Ankit Saxena on 29/12/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class BaseCollectionPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let mainCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BaseCollectionCell.self, forCellWithReuseIdentifier: "mainCell")
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollection.delegate = self
        mainCollection.dataSource = self
        view.addSubview(mainCollection)
        setupUI()
    }
    
    func setupUI(){
        mainCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        mainCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        mainCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        mainCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! BaseCollectionCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.green : UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = view.safeAreaLayoutGuide.layoutFrame
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
