describe('jungle product details', () => {
  beforeEach(() => {
   cy.visit('localhost:3000')
  })

  it("Adds a product to the cart when selecting Add button", () => {
      
    cy.get("a")
      .contains('My Cart (0)')
      .should("be.visible")

    cy.get("button")
        .contains("Add")
        .first()
        .click({force: true})

    cy.get("a")
      .contains('My Cart (1)') 
  })
})

