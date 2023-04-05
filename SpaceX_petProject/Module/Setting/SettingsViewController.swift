//
//  SettingsViewController.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//
import UIKit

final class SettingsViewController: UIViewController {
    private var tableView = UITableView()
    private lazy var dataSource = makeDataSource()
    var presenter: SettingPresenter! {
        didSet {
            presenter.present = present

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

private extension SettingsViewController {
    func present(settings: [Setting]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, Setting>()
        /*
        этот объект создает снимок источника данных и используется для обновления таблицы, в конечном счёте именно этот метод пападёт в виде замыкания в объект SettingPresenter() созданный в этом классе через didSet выше, сетапнется (зальются дефолтные настройки из SettingsRepository.get() ) затем сюда передастся созданный массив настроек и в конфиге отобразятся сначала дефолтные данные, если поменяем положения segmentedContrlol, данные перезапишутся, и сохранятся
        */
        snapshot.appendSections([""])
        snapshot.appendItems(settings, toSection: "")
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    func configureTableView() {
        
    }
    
    
    func makeDataSource() -> UITableViewDiffableDataSource<String, Setting> {
        .init(tableView: tableView) { [weak self] tableView, IndexPath, setting in
            guard let self,
                  let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifire,
                                                           for: IndexPath) as? SettingTableViewCell else {
                return UITableViewCell() // вернёт новую, нужно понять как новая тогда будет заполнена данными
            }
            cell.configure(with: setting, settingChanged: self.presenter.change)
        /* этот метод конфигурит саму ячейку, какое замыкание и данные передадим такая и будет конфигурация данных при измении положения сегментконтрола, нам нужно чтобы ячейка была нужной нам формы и с нужными данными, в данном случае меняются только данные (замыкание в конфигураторе заюзается только по нажатию), а если бы ячеек было больше чем может вместить экран, то 1 ячейка бы всё время переиспользовалась и подтягивала данные по индексу. данные в таблице по проекту не будут меняться, эти изменения коснуться других экранов
         */
            return cell
        }
        /*
            .init создает объект UITableViewDiffableDataSource и связывает таблицу с данными в diffable формате,
            вторым параметром идёт замыкание cellProvider:, которое предоставит ячейку каждый раз при запросе, принимает 3 параметра
            tableView
            IndexPath структура с номером секции и ячейки
            setting это элементы данных, который надо отобразить
            в замыкании проверка self, создается переиспользуемая ячейка нужного нам типа или новая
            далее конфигурим ячейку SettingTableViewCell обращаемся к её методу .configure, передаём в него данные (элемент массива [Setting]), эти данные чере замыкание .change установятся в ячейку
        */
    }
}

private extension SettingsViewController {
    func addSubview() {
        [tableView].forEach(view.addSubview)
        /*
         добавляет всё что в массиве на контроллер
        */
    }
    func configureLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
