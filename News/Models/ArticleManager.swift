//
//  ArticleManager.swift
//  News
//
//  Created by Аскар Ахметьянов on 12.12.2024.
//

import UIKit

private let decoder: JSONDecoder = JSONDecoder()
private var newsPage: NewsPage = NewsPage()

final class ArticleManager {
    var news: [ArticleModel]?
    
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
        URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)")
    }

    // MARK: - Fetch news
    private func fetchNews() {
        guard let url = getURL(4, 1) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            if
                let data = data,
                var newsPage = try? decoder.decode(NewsPage.self, from: data)
            {
                newsPage.passTheRequestId()
                self?.news = newsPage.news
            }

        }.resume()
    }
}
