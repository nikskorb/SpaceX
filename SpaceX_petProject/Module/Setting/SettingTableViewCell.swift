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
            /*
                требуемый протоколом NSCoding на который подписан тип UITableViewCell, опциональный инициализатор, в таких случаях (когда нам не нужен класс SettingTableViewCell для декодирования) лучше написать fatalError("Error") для предотвращения случайного использования этого метода.
            */
        }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        segmentControl.removeAllSegments()
        /*
         Метод prepareForReuse() вызывается у ячейки таблицы всякий раз, когда она готовится к повторному использованию. В этом методе удаляются все предыдущие сегменты segmentControl для того, чтобы не было сбоев в отображении сегментов на новых ячейках, которые будут использоваться повторно. Таким образом, метод segmentControl.removeAllSegments() гарантирует, что segmentControl будет находиться в правильном состоянии перед повторным использованием ячейки.
        */
    }
    
    func configure(with setting: Setting, settingChanged: @escaping(Setting) -> Void) {
        for unit in setting.type.units {
            segmentControl.insertSegment(withTitle: unit.name, at: 0, animated: false)
        }
        nameLabel.text = setting.type.name
        segmentControl.selectedSegmentIndex = setting.selectedIndex
            /*
             configure используется для настройки пользовательского интерфейса в соответствии с переданным объектом setting. Она добавляет каждую доступную единицу измерения в UISegmentedControl с помощью метода insertSegment, устанавливает название типа настройки в UILabel nameLabel и устанавливает выбранный пользователем вариант в selectedIndex UISegmentedControl с помощью свойства selectedSegmentIndex
             */
        
//        segmentControl remove action
        segmentControl.addAction(UIAction { [segmentControl] _ in
                let setting = Setting(type: setting.type,
                                      selectedIndex: segmentControl.selectedSegmentIndex)
                settingChanged(setting)
            /*
             добавляет замыкание UIAction в UISegmentedControl, которое вызывается при изменении выбранного пользователем варианта. Замыкание создает новый объект Setting на основе типа настройки и выбранного пользователем варианта, и вызывает замыкание settingChanged с этим новым объектом Setting в качестве аргумента.
             */
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
