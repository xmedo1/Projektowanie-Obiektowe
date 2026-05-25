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
        let products = try await Product.query(on: req.db).with(\.$category).all()
        let categories = try await Category.query(on: req.db).all()
        
        struct Context: Encodable { let products: [Product]; let categories: [Category] }
        return try await req.view.render("index", Context(products: products, categories: categories))
    }

    func create(req: Request) async throws -> Response {
        let name = try req.content.get(String.self, at: "name")
        let price = try req.content.get(Double.self, at: "price")
        let categoryID = try req.content.get(UUID.self, at: "categoryID")
        
        let product = Product(name: name, price: price, categoryID: categoryID)
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
        let categories = try await Category.query(on: req.db).all()
        
        struct EditContext: Encodable { 
            let product: Product
            let categories: [Category]
            let currentCat: UUID 
        }
        
        return try await req.view.render("edit", EditContext(product: product, categories: categories, currentCat: product.$category.id))
    }

    func update(req: Request) async throws -> Response {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        product.name = try req.content.get(String.self, at: "name")
        product.price = try req.content.get(Double.self, at: "price")
        product.$category.id = try req.content.get(UUID.self, at: "categoryID")
        
        try await product.update(on: req.db)
        
        return req.redirect(to: "/web/products")
    }
}