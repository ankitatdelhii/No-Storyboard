//
//  ViewController.swift
//  ProgrammaticUI-3
//
//  Created by Ankit Saxena on 29/12/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    let topImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.image = UIImage(named: "t3")
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us Today in our fun Games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of un? Don't wait further! We hope to see you on our store very soon!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.0)]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let topContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(topContainerView)
        view.addSubview(descriptionTextView)
        setupUI()
        
    }
    
    private func setupUI(){
        
        // Container View
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.addSubview(topImageView)
        
        // ImageView
        topImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor, constant: 0.0).isActive = true
        topImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: 0.0).isActive = true
        topImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageView.widthAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 1.0).isActive = true
        
        // Description Text View
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 100.0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        
    }


}

