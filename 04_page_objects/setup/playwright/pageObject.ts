// @ts-ignore
import { expect, Locator, Page } from "@playwright/test";

export class PageObject {
  readonly page: Page;
  private readonly header: Locator;
  private readonly sidebar: Locator;
  private readonly mainContent: Locator;
  private readonly footer: Locator;

  constructor(page: Page) {
    this.page = page;
    this.header = page.locator("header");
    this.sidebar = page.locator("aside");
    this.mainContent = page.locator("main");
    this.footer = page.locator("footer");
  }

  async goto() {
    await this.page.goto("/");
  }

  async getHeader() {
    return this.header.textContent();
  }

  async getSidebar() {
    return this.sidebar.nth(0).textContent();
  }

  async getMainContent() {
    return this.mainContent.inputValue();
  }

  async getFooter() {
    return this.footer.inputValue();
  }

  async isHeaderVisible() {
    await expect(await this.header.isVisible()).toBeTruthy();
  }

  async isSidebarVisible() {
    await expect(await this.sidebar.isVisible()).toBeTruthy();
  }

  async isMainContentVisible() {
    await expect(await this.mainContent.isVisible()).toBeTruthy();
  }

  async isFooterVisible() {
    await expect(await this.footer.isVisible()).toBeTruthy();
  }

  async getSidebarButtons() {
    return this.page.locator(".sidebar-btn");
  }

  async getSidebarButtonCount() {
    const sidebarButtons = await this.getSidebarButtons();
    return sidebarButtons.count();
  }

  async isSidebarButtonLinkCorrect(index, expectedLink) {
    const sidebarButtons = await this.getSidebarButtons();
    const button = sidebarButtons.nth(index);
    const href = await button.getAttribute("href");
    await expect(href).toContain(expectedLink);
  }
}
