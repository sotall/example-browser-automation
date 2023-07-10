import { test, expect } from "@playwright/test";
import { RandomTextPage } from "./randomTextPage";

test.describe("Random Text Web Page", () => {
    test("should display the header, sidebar, main content, and footer", async ({page}) => {
        const randomTextPage = new RandomTextPage(page);
        await randomTextPage.goto();
        await randomTextPage.isHeaderVisible();
        await randomTextPage.isSidebarVisible();
        await randomTextPage.isMainContentVisible();
        await randomTextPage.isFooterVisible();
    });

    test("should contain sidebar buttons with correct links", async ({page}) => {
        const randomTextPage = new RandomTextPage(page);
        await randomTextPage.goto();

        const buttonCount = await randomTextPage.getSidebarButtonCount();
        expect(buttonCount).toBe(3);

        for (let i = 0; i < buttonCount; i++) {
            await randomTextPage.isSidebarButtonLinkCorrect(
                i,
                `page${i + 1}.html`
            );
        }
    });
});
