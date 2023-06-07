
describe('Jungle app', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/')
   });

    it('visit the home page', () => {
      cy.visit('http://localhost:3000/')
    });

    it("There is products on the page", () => {
      cy.get(".products article").should("be.visible");
      cy.get(".products article:first").click();
    });

    it("There are 12 products on the page", () => {
      cy.get(".products article").should("have.length", 12);
    });

});