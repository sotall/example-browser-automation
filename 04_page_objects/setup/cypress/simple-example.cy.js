import RandomTextPage from './randomTextPage';

describe('Random Text Web Page', () => {
  beforeEach(() => {
    RandomTextPage.visit();
  });

  it('should display the header, sidebar, main content, and footer', () => {
    RandomTextPage.header.should('be.visible');
    RandomTextPage.sidebar.should('be.visible');
    RandomTextPage.mainContent.should('be.visible');
    RandomTextPage.footer.should('be.visible');
  });

  it('should contain sidebar buttons with correct links', () => {
    RandomTextPage.sidebarButtons.should('have.length', 3);

    RandomTextPage.sidebarButtons.each(($btn, index) => {
      cy.wrap($btn).should('have.attr', 'href').and('include', `page${index + 1}.html`);
    });
  });
});
