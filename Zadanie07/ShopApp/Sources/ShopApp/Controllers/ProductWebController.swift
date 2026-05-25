import Fluent
import Vapor

struct ProductWebController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let webProducts = routes.grouped("web", "products")
        webProducts.get(use: index)
        webProducts.post(use: create)
        webProducts.post(":productID", "delete", use: delete)
        webProducts.get(":productID", "edit", use: editView)
        webProducts.post(":productID", "edit", use: update)
    }

    func index(req: Request) async throws -> View {
        let products = try await Product.query(on: req.db).all()
        return try await req.view.render("index", ["products": products])
    }

    func create(req: Request) async throws -> Response {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return req.redirect(to: "/web/products")
    }

    func delete(req: Request) async throws -> Response {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        return req.redirect(to: "/web/products")
    }

    func editView(req: Request) async throws -> View {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return try await req.view.render("edit", ["product": product])
    }

    func update(req: Request) async throws -> Response {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        let updatedData = try req.content.decode(Product.self)
        product.name = updatedData.name
        product.price = updatedData.price
        try await product.update(on: req.db)
        
        return req.redirect(to: "/web/products")
    }
}