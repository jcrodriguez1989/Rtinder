context("test-getownmetadata")

test_that("can get own metadata", {
    skip_if_offline()
    skip_if(!login())

    own_meta <- getOwnMetadata()
    expect_true(length(own_meta) > 0)
    expect_true("user" %in% names(own_meta))
})
