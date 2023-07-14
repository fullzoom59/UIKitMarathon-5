//
//  PopoverViewController.swift
//  Compact Controller
//
//  Created by fullzoom on 13.07.2023.
//

import UIKit

class PopoverViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func closeButtonTapped(_ sender: UIButton){
        dismiss(animated: true)
    }
    
    @objc func segmentedControlValueChanged(_ segmenedControl: UISegmentedControl){
        if segmenedControl.selectedSegmentIndex == 0{
            preferredContentSize = CGSize(width: 300, height: 280)
        }else{
            preferredContentSize = CGSize(width: 300, height: 150)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 300, height: 280)
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
        setupConstraints()
    }

}

private extension PopoverViewController{
    func setupConstraints(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
