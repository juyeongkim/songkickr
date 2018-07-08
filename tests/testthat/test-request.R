context("request")

artist_id <- 4651203 # The Suffers
venue_id <- 247 # The Tractor Tavern
metro_area_id <- 2846 # Seattle
username <- "platyjus" # Package author's username
event_id <- 24459899 # Jose Gonzalez at Republic in NOLA

test_that("`get_artist_calendar` works", {
  res <- songkickr:::get_artist_calendar(artist_id)

  expect_is(res, "data.frame")
})

test_that("`get_venue_calendar` works", {
  res <- songkickr:::get_venue_calendar(venue_id)

  expect_is(res, "data.frame")
})

test_that("`get_metro_calendar` works", {
  res <- songkickr:::get_metro_calendar(metro_area_id)

  expect_is(res, "data.frame")
})

test_that("`get_user_event` works", {
  res <- songkickr:::get_user_event(username)

  expect_is(res, "data.frame")
})

test_that("`get_user_calendar` works", {
  res <- songkickr:::get_user_calendar(username)

  expect_is(res, "data.frame")
})

test_that("`get_tracked_metro_by_user` works", {
  res <- songkickr:::get_tracked_metro_by_user(username)

  expect_is(res, "data.frame")
})

test_that("`get_tracked_artists_by_user` works", {
  res <- songkickr:::get_tracked_artists_by_user(username)

  expect_is(res, "data.frame")
})

test_that("`get_muted_artists_by_user` works", {
  res <- songkickr:::get_muted_artists_by_user(username)

  expect_is(res, "data.frame")
})

test_that("`get_gigography_artist` works", {
  res <- songkickr:::get_gigography_artist(artist_id)

  expect_is(res, "data.frame")
})

test_that("`get_gigography_user` works", {
  res <- songkickr:::get_gigography_user(username)

  expect_is(res, "data.frame")
})

test_that("`get_event` works", {
  res <- songkickr:::get_event(event_id)

  expect_is(res, "list")
})

test_that("`get_venue` works", {
  res <- songkickr:::get_venue(venue_id)

  expect_is(res, "list")
})

test_that("`get_similar_artists` works", {
  res <- songkickr:::get_similar_artists(artist_id)

  expect_is(res, "data.frame")
})

test_that("`search_event` works", {
  res <- songkickr:::search_event("Ólafur Arnalds")

  expect_is(res, "data.frame")
})

test_that("`search_artist` works", {
  res <- songkickr:::search_artist("Helado Negro")

  expect_is(res, "data.frame")
})

test_that("`search_venue` works", {
  res <- songkickr:::search_venue("Fitzgerald's")

  expect_is(res, "data.frame")
})

test_that("`search_location` works", {
  res <- songkickr:::search_location("Fife")

  expect_is(res, "data.frame")
})
