//
//  UserRepository.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation
import CoreData

protocol UserRepositoryProtocol {
    func getUserInfo() async -> User?
    func saveUserInfo(_ userName: String) async
}

final class UserRepository: UserRepositoryProtocol {
    private let viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = viewContext
    }

    func getUserInfo() async -> User? {
        await viewContext.perform {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.fetchLimit = 1
            do {
                return try self.viewContext.fetch(fetchRequest).first
            } catch {
                print("Error fetching user info: \(error)")
                return nil
            }
        }
    }

    func saveUserInfo(_ userName: String) async {
        await viewContext.perform {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            do {
                let results = try self.viewContext.fetch(fetchRequest)

                if let existingUser = results.first {
                    existingUser.userName = userName
                } else {
                    let newEntity = User(context: self.viewContext)
                    newEntity.userName = userName
                }

                try self.viewContext.save()
            } catch {
                print("Error saving user info: \(error)")
            }
        }
    }
}
