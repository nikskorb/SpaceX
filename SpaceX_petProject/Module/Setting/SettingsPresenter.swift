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
        
        currentSettings.remove(at: changedIndex)
        currentSettings.insert(setting, at: changedIndex)
        settingRepository.save(currentSettings) 
    }
    
    
}

private extension SettingPresenterImpl {
    func setup() {
        let settings = settingRepository.get()
        present?(settings)
    }
}
