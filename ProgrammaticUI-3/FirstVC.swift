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
        textView.text = "Join us Today in our fun Games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18.0)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(topImageView)
        view.addSubview(descriptionTextView)
        setupUI()
        
    }
    
    private func setupUI(){
        topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        topImageView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        
        // Description Text View
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 100.0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        
    }


}

