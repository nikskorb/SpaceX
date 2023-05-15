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
                return UITableViewCell() 
            }
            cell.configure(with: setting, settingChanged: self.presenter.change)

            return cell
        }
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
