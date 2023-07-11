class PageObject {
  // Elements
  get header() {
    return cy.get('header');
  }

  get sidebar() {
    return cy.get('aside');
  }

  get mainContent() {
    return cy.get('main');
  }

  get footer() {
    return cy.get('footer');
  }

  get sidebarButtons() {
    return cy.get('.sidebar-btn');
  }

  // Actions
  visit() {
    cy.visit('/');
  }
}

export default new PageObject();
