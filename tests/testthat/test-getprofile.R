context("test-getprofile")

test_that("can get profile", {
    skip_if_offline()
    skip_if(!login())

    updates <- getUpdates()
    skip_if(length(updates$matches) == 0)
    one_match <- updates$matches[[1]]
    profile <- getProfile(one_match$person$`_id`)
    expect_true(length(profile) > 0)
    expect_true("name" %in% names(profile))
    expect_equal(one_match$person$name, profile$name)
})
