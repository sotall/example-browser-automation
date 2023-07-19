// @ts-ignore
import { test, expect } from "@playwright/test";
import { PageObject } from "./pageObject";

test.describe("Random Text Web Page", () => {
  test("should display the header, sidebar, main content, and footer", async ({
    page,
  }) => {
    const pageObject = new PageObject(page);
    await pageObject.goto();
    await pageObject.isHeaderVisible();
    await pageObject.isSidebarVisible();
    await pageObject.isMainContentVisible();
    await pageObject.isFooterVisible();
  });

  test("should contain sidebar buttons with correct links", async ({
    page,
  }) => {
    const pageObject = new PageObject(page);
    await pageObject.goto();

    const buttonCount = await pageObject.getSidebarButtonCount();
    expect(buttonCount).toBe(3);

    for (let i = 0; i < buttonCount; i++) {
      await pageObject.isSidebarButtonLinkCorrect(i, `page${i + 1}.html`);
    }
  });
});
