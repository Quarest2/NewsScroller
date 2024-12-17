//
//  ArticleCellView.swift
//  News
//
//  Created by Аскар Ахметьянов on 12.12.2024.
//

import UIKit

class ArticleCell: UITableViewCell {
    // MARK: - Fields
    static let reuseId: String = "ArticleCell"
    var title: String = ""
    var newsDescription: String = ""
    var imageURL: ImageContainer?
    
    // MARK: - Properties
    var addWish: ((String) -> Void)?
    
    // MARK: - Lifecycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Private Methods
    private func loadImage() -> UIImage? {
        guard let data = try? Data(contentsOf: (imageURL?.url )!) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    private func configureUI() {
        
    }
}
