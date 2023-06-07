
describe('Jungle app', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/')
   });

    it("add 1 product to 'My Cart' by click on 'Add' button", () => {
      cy.contains("Add").first().click({ force: true });
      cy.contains("My Cart (1)");
    });

});