const { test, expect } = require('@playwright/test');

test.describe('Login Form', () => {
    test.beforeEach(async ({ page }) => {
        await page.goto('/');
        await expect(page.locator('#username')).toBeVisible({ timeout: 2000 })
    });

    test('Example to demonstrate text input and basic assertions', async ({ page }) => {
        await page.fill('#username', 'foo')
        await page.fill('#password', 'bar')
        await page.click('button[type="submit"]')
        await expect(page.locator('body')).toContainText('You have successfully logged in.')
    })
});
