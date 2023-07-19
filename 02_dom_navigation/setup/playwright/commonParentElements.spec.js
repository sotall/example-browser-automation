import { test, expect } from '@playwright/test';

test.describe('launch test page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('should add selected items to the list of purchased items', async ({ page }) => {
    // Ensure the list of purchased items is initially empty
    const purchasedItems = await page.waitForSelector('#purchased-items');
    expect(await purchasedItems.innerText()).toBe('');

    // Click on the "Buy" button for the Orange item
    const orangeBuyButton = await page.waitForSelector('tbody tr:has(td:contains("Orange")) .buy-button');
    await orangeBuyButton.click();

    // Verify that the Orange item is displayed in the list of purchased items
    await page.waitForSelector('#purchased-items:has(li:contains("Orange"))');
    const purchasedItemsWithOrange = await page.$eval('#purchased-items', el => el.innerText);
    expect(purchasedItemsWithOrange).toContain('Orange');
  });
});
