context("test-like")

test_that("can like", {
    skip_if_offline()
    skip_if(!login())
    skip_if(Sys.getenv("USER") != "jcrodriguez")

    swipes <- getSwipes()
    skip_if(length(swipes) == 0)
    one_swipe <- swipes[[1]]
    liked <- like(one_swipe$user$`_id`)
    expect_true(length(liked) > 0)
    expect_is(liked$match, "logical")
})
