context("test-changesettings")

test_that("can change settings", {
    skip_if_offline()
    skip_if(!login())

    old_config <- getOwnProfile()
    old_distance <- old_config$distance_filter
    new_conf <- changeSettings(
        list(distance_filter = old_distance+1))
    expect_equal(old_distance+1, new_conf$distance_filter)

    new_new_config <- getOwnProfile()
    expect_equal(old_distance+1, new_new_config$distance_filter)
    changeSettings(list(distance_filter = old_distance))
})
