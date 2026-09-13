//
//  PersistenceController.swift
//  AfterMedia
//
//  Created by Herman Khodyrev on 13.09.26.
//

import CoreData

final class PersistenceController {
  
  let container: NSPersistentContainer
  
  init() {
    container = NSPersistentContainer(name: "DiaryModel")
    container.loadPersistentStores{ _, error in
      if let error {
        fatalError("Failed to load Core Data store: \(error)")
      }
    }
  }
}
