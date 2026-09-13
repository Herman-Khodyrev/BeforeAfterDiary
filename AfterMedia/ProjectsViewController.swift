//
//  ViewController.swift
//  AfterMedia
//
//  Created by Herman Khodyrev on 13.09.26.
//

import UIKit
internal import CoreData

class ProjectsViewController: UIViewController, UITableViewDataSource {
  private let context: NSManagedObjectContext
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    return tableView
  }()
  
  private lazy var emptyLabel: UILabel = {
    let label = UILabel()
    label.text = "No projects yet."
    label.textColor = .secondaryLabel
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
  
  private var projects: [Project] = []
  
  init(context: NSManagedObjectContext) {
    self.context = context
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Projects"
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    tableView.backgroundView = emptyLabel

    loadProjects()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return projects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseIdentifier = "ProjectCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)

    var content = cell.defaultContentConfiguration()
    content.text = projects[indexPath.row].title
    cell.contentConfiguration = content
    return cell
  }
}

extension ProjectsViewController {
  private func loadProjects() {
    let fetchRequest = Project.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Project.createdAt, ascending: false)]
    do {
      let fetchResult = try context.fetch(fetchRequest)
      projects = fetchResult
      tableView.reloadData()
      emptyLabel.isHidden = !projects.isEmpty
    } catch {
      fatalError("Cannot load projects: \(error)")
    }
  }
}

