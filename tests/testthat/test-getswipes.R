context("test-getswipes")

test_that("can get swipes", {
    skip_if_offline()
    skip_if(!login())

    swipes <- getSwipes()
    expect_true(length(swipes) > 0)
})
