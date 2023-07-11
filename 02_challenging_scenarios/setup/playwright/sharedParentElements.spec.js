const { test, expect } = require('@playwright/test');
const BASE_URL = process.env.BASE_URL;

test.describe('Produce Purchase', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(BASE_URL);
  });

  test('Navigate to Google', async ({ page }) => {
    const url = await page.url();
    expect(url).toContain('http://web/');

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
