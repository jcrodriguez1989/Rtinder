context("test-getmatchinfo")

test_that("can get match info", {
    skip_if_offline()
    skip_if(!login())

    updates <- getUpdates()
    skip_if(length(updates$matches) == 0)
    one_match <- updates$matches[[1]]
    match_info <- getMatchInfo(one_match$id)
    expect_true(length(match_info) > 0)
    expect_true("id" %in% names(match_info))
    expect_equal(one_match$id, match_info$id)
    expect_equal(one_match$person$name, match_info$person$name)
})
