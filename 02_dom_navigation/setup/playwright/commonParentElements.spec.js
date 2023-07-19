const { test, expect } = require('@playwright/test');

test.describe('launch test page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(process.env.BASE_URL);
  });

  test('should add selected items to the list of purchased items', async ({ page }) => {
    const url = await page.url();
    expect(url).toContain('http://frontend/');

    const content = await page.textContent('#purchased-items');
    expect(content).toBeFalsy();

    await page.click('text=Orange');
    const elementHandle = await page.$('text=Orange');
    const parentElementHandle = await elementHandle.$('xpath=ancestor::tbody[1]');
    const buttonElementHandle = await parentElementHandle.$('.buy-button');
    await buttonElementHandle.click();

    const purchasedItems = await page.$('#purchased-items');
    const purchasedItemsText = await purchasedItems.innerText();
    expect(purchasedItemsText).toContain('Orange');
    expect(await purchasedItems.isVisible()).toBe(true);
  });
});
