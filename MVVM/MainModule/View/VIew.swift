//
//  VIew.swift
//  MVVM
//
//  Created by Inna Kokorina on 20.07.2022.
//

import UIKit

class View: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    lazy var activityIndication = makeActivityIndicator()

    override func layoutSubviews() {
        super.layoutSubviews()
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndication.isHidden = true
            activityIndication.stopAnimating()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndication.isHidden = false
            activityIndication.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndication.isHidden = true
            activityIndication.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
        }
    }
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
}
