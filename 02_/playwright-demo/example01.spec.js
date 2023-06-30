const { test, expect } = require('@playwright/test');

test.describe('Produce Purchase', () => {
    test.beforeEach(async ({ page }) => {
        // Load the local HTML file.
        await page.goto('http://web:80');
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
