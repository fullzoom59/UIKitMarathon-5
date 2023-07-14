//
//  ViewController.swift
//  Compact Controller
//
//  Created by fullzoom on 13.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        var configuration = UIButton.Configuration.plain()
        button.configuration = configuration
        button.addTarget(self, action: #selector(presentPopoverController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutButton()
    }
    
    @objc func presentPopoverController(_ sender: UIButton){
        let vc = PopoverViewController()
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = sender.bounds
        vc.popoverPresentationController?.permittedArrowDirections = .up
        vc.popoverPresentationController?.delegate = self
        present(vc, animated: true)
    }

    private func layoutButton(){
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150)
        ])
    }
}


extension ViewController: UIPopoverPresentationControllerDelegate {
    // 1
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    // 2
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
}
