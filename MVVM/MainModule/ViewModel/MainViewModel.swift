//
//  MainViewModel.swift
//  MVVM
//
//  Created by Inna Kokorina on 20.07.2022.
//

import Foundation
protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set}
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())?
    init() {
        updateViewData?(.initial)
    }
    func startFetch() {
        //start loading
        updateViewData?(.loading(ViewData.Data(icon: nil, title: nil, description: nil, numberPhone: nil)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success", title: "Success", description: "Good", numberPhone: nil)))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure", title: "Failure", description: "Error", numberPhone: nil)))
        }
    }
    
    
}
