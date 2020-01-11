//
//  BaseCollectionPage.swift
//  ProgrammaticUI-3
//
//  Created by Ankit Saxena on 29/12/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class BaseCollectionPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Bottom
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor.blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.tintColor = UIColor.gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.tintColor = UIColor.gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }()

    
    let mainCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BaseCollectionCell.self, forCellWithReuseIdentifier: "mainCell")
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    let pages = [Page(imageName: "t1", headerText: "Join us today in our fun and games!", description: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon!"), Page(imageName: "t2", headerText: "Subscribe and Get Coupons on our daily events!", description: "Get notified of the savings immediately when we announce them on our website. Make sure to give us any feedback you have."), Page(imageName: "t3", headerText: "VIP Members Special Service!", description: "This is the dummy text to get you a VIP pass for all your dinner needs at various luxury restraunts around the world!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        mainCollection.delegate = self
        mainCollection.dataSource = self
        view.addSubview(mainCollection)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(previousButton)
        bottomStackView.addArrangedSubview(pageControl)
        bottomStackView.addArrangedSubview(nextButton)
        setupUI()
        
        // nextButton
        nextButton.addTarget(self, action: #selector(nextBtnPressed), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(prevBtnPressed), for: .touchUpInside)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition(in: view, animation: { _ in
            self.mainCollection.collectionViewLayout.invalidateLayout()
            let index = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.mainCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }, completion: nil)
        
    }
    
    @objc func nextBtnPressed() {
        let nextIndex = pageControl.currentPage + 1
        if nextIndex < pages.count {
            pageControl.currentPage = nextIndex
            let index = IndexPath(item: nextIndex, section: 0)
            mainCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc func prevBtnPressed(){
        let prevIndex = pageControl.currentPage - 1
        if prevIndex >= 0 {
            pageControl.currentPage = prevIndex
            let index = IndexPath(item: prevIndex, section: 0)
            mainCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x, view.frame.width, x/view.frame.width)
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    func setupUI(){
        mainCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        mainCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0).isActive = true
        mainCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
        mainCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0).isActive = true
        
        // Bottom Stack View
        NSLayoutConstraint.activate([
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! BaseCollectionCell
        let page = pages[indexPath.row]
        cell.page = page
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.green : UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = view.safeAreaLayoutGuide.layoutFrame
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
