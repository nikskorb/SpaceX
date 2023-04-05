//
//  RocketButtonCollectionViewCell.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 04.04.2023.
//

import UIKit

final class RocketButtonCollectionViewCell: UICollectionViewCell {
    private let openLaunchesButton = UIButton()
    var onOpenLauches: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEverything()
        openLaunchesButton.addTarget(self, action: #selector(openLaunches), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Error")
        
    }

}

private extension RocketButtonCollectionViewCell {
    @objc func openLaunches() {
        onOpenLauches?()
    }
    func setupEverything() {
        contentView.addSubview(openLaunchesButton)
        openLaunchesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openLaunchesButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            openLaunchesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            openLaunchesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            openLaunchesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
