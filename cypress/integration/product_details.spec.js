
describe('Jungle app', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000/')
   });

    it("Visit the page with detailed information regarding product by click on its image", () => {
      cy.get(".products article:first").click();
    });

});