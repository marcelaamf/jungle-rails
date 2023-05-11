describe('jungle product details', () => {
  beforeEach(() => {
   cy.visit('localhost:3000')
  })

  it("Navigates to the product detail page by clicking on a product", () => {
      cy.get(".products article")
        .first()
        .click()

      cy.url().should('include', "products")

      cy.get(".product-detail")
        .should("be.visible")
  })
})
