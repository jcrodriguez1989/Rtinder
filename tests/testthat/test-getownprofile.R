context("test-getownprofile")

test_that("can get own profile", {
    skip_if_offline()
    skip_if(!login())

    own_profile <- getOwnProfile()
    expect_true(length(own_profile) > 0)
    expect_true("distance_filter" %in% names(own_profile))
})
