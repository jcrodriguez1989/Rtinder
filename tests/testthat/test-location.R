context("test-location")

test_that("can chagen location", {
    skip_if_offline()
    skip_if(!login())
    skip_if(Sys.getenv("USER") != "jcrodriguez")

    dif <- 10
    profile <- getOwnProfile()
    skip_if(!"pos" %in% names(profile))
    old_pos <-profile$pos

    changeLocation(old_pos$lat+dif, old_pos$lon+dif)
    new_prof <- getOwnProfile()
    new_pos <- new_prof$pos
    expect_equal(old_pos$lat+dif, new_pos$lat)
    expect_equal(old_pos$lon+dif, new_pos$lon)

    changeLocation(old_pos$lat, old_pos$lon)
})
