import Fluent
import Vapor

struct CategoryWebController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let webCategories = routes.grouped("web", "categories")
        webCategories.get(use: index)
        webCategories.post(use: create)
        webCategories.post(":categoryID", "delete", use: delete)
        webCategories.get(":categoryID", "edit", use: editView)
        webCategories.post(":categoryID", "edit", use: update)
    }

    func index(req: Request) async throws -> View {
        let categories = try await Category.query(on: req.db).with(\.$products).all()
        return try await req.view.render("categories", ["categories": categories])
    }

    func create(req: Request) async throws -> Response {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return req.redirect(to: "/web/categories")
    }

    func editView(req: Request) async throws -> View {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return try await req.view.render("category_edit", ["category": category])
    }

    func update(req: Request) async throws -> Response {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        category.name = try req.content.get(String.self, at: "name")
        try await category.update(on: req.db)
        return req.redirect(to: "/web/categories")
    }

    func delete(req: Request) async throws -> Response {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await category.delete(on: req.db)
        return req.redirect(to: "/web/categories")
    }
}