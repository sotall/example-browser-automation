import PageObject from './pageObject';

describe('Random Text Web Page', () => {
  beforeEach(() => {
    PageObject.visit();
  });

  it('should display the header, sidebar, main content, and footer', () => {
    PageObject.header.should('be.visible');
    PageObject.sidebar.should('be.visible');
    PageObject.mainContent.should('be.visible');
    PageObject.footer.should('be.visible');
  });

  it('should contain sidebar buttons with correct links', () => {
    PageObject.sidebarButtons.should('have.length', 3);

    PageObject.sidebarButtons.each(($btn, index) => {
      cy.wrap($btn).should('have.attr', 'href').and('include', `page${index + 1}.html`);
    });
  });
});
