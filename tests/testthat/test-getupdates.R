context("test-getupdates")

test_that("can get updates", {
    skip_if_offline()
    skip_if(!login())

    updates <- getUpdates()
    expect_true(length(updates) > 0)
    expect_true("matches" %in% names(updates))
})
