import { test, expect } from '@playwright/test';

test.describe('launch test page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('should display the correct heading text when the header is present or not', async ({ page }) => {
    const isHeaderPresent = await page.$eval('#header-title', el => !!el);

    if (isHeaderPresent) {
      // If the header is present, verify that the heading text is correct
      const headerTitle = await page.innerText('#header-title');
      expect(headerTitle).toBe('Fresh Produce Emporium');
    } else {
      // If the header is not present, assert that the h1 element doesn't exist
      const h1Element = await page.$('h1');
      expect(h1Element).toBeNull();
    }
  });
});
