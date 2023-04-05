//
//  SettingsPresenter.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//
protocol SettingPresenter {
    var present: (([Setting]) -> Void)? { get set }
    
    func change(setting: Setting)

}

final class SettingPresenterImpl: SettingPresenter {
    private let settingRepository: SettingsRepository
    var present: (([Setting]) -> Void)?
    
    init(settingRepository: SettingsRepository) {
        self.settingRepository = settingRepository
        setup()
    }
    
    func change(setting: Setting) {
        var currentSettings = settingRepository.get()
        guard let changedIndex = currentSettings.firstIndex(where: { $0.type == setting.type })
        else {
            return
        }
        /*
        изменяет значение, принимает параметром измененный объект setting в ячейке, сперва так же как и в случае с present устанавливает в текущие настройки settingRepository.get(), затем перебирает и проверяет на соответствие массив setting.type, когда находит соотв., удаляет из массива данную конфигу настроек и её в переданный в функцию массив,
         затем сэйвит
        */
        currentSettings.remove(at: changedIndex)
        currentSettings.insert(setting, at: changedIndex)
        settingRepository.save(currentSettings) //засэйвит текущий элемент массива настроек пользователя 
    }
    
    
}

private extension SettingPresenterImpl {
    func setup() {
        let settings = settingRepository.get()
        present?(settings)
    }
}
