//
//  SettingTableViewCell.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
// 
import UIKit
final class SettingTableViewCell: UITableViewCell {
    private let segmentControl = UISegmentedControl()
    private let nameLabel = UILabel()
    var settingChange: ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdentifire: String?)  {
        super.init(style: style, reuseIdentifier: reuseIdentifire)
            addSubViews()
            configureLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Error")

        }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        segmentControl.removeAllSegments()

    }
    
    func configure(with setting: Setting, settingChanged: @escaping(Setting) -> Void) {
        for unit in setting.type.units {
            segmentControl.insertSegment(withTitle: unit.name, at: 0, animated: false)
        }
        nameLabel.text = setting.type.name
        segmentControl.selectedSegmentIndex = setting.selectedIndex

        segmentControl.addAction(UIAction { [segmentControl] _ in
                let setting = Setting(type: setting.type,
                                      selectedIndex: segmentControl.selectedSegmentIndex)
                settingChanged(setting)

        },
            for: .valueChanged
        )
    }
}

private extension SettingTableViewCell {
    func addSubViews() {
        [segmentControl, nameLabel].forEach(contentView.addSubview)
    }
    
    func configureLayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
