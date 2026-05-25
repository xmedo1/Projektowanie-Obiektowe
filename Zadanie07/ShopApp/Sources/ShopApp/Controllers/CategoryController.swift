import Fluent
import Vapor

struct CategoryController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let categories = routes.grouped("categories")
        
        categories.get(use: index)
        categories.post(use: create)
        categories.put(":categoryID", use: update)
        categories.delete(":categoryID", use: delete)
        
        categories.get(":categoryID", "products", use: getProducts)
    }

    func index(req: Request) async throws -> [Category] {
        return try await Category.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Category {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return category
    }

    func update(req: Request) async throws -> Category {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }

        category.name = try req.content.get(String.self, at: "name")
        
        try await category.update(on: req.db)
        return category
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await category.$products.query(on: req.db).delete()
        try await category.delete(on: req.db)
        
        return .ok
    }

    func getProducts(req: Request) async throws -> Category {
        guard let category = try await Category.query(on: req.db)
            .filter(\.$id == req.parameters.get("categoryID")!)
            .with(\.$products)
            .first() else {
            throw Abort(.notFound)
        }
        return category
    }
}