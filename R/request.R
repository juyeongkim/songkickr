get_key <- function() {
  key <- Sys.getenv("songkick_key")

  if (identical(key, "")) {
    stop(
      "Please set environment variable `songkick_key` to your songkick API key",
      call. = FALSE
    )
  }

  key
}

#' @importFrom utils packageVersion
get_useragent <- function() {
  paste0(
    "R/", R.version$major, ".", R.version$minor,
    " (", Sys.info()["sysname"], " ", Sys.info()["machine"], ")",
    " songkickr/", packageVersion("songkickr")
  )
}

#' @importFrom httr GET content config
#' @importFrom jsonlite fromJSON
request <- function(endpoint, query = list()) {
  res <- GET(
    url = "https://api.songkick.com",
    path = c("api", "3.0", endpoint),
    query = c(query, apikey = get_key()),
    config = config(useragent = get_useragent())
  )

  text <- content(res, "text")
  parsed <- fromJSON(text, flatten = TRUE)
  results <- parsed$resultsPage$results[[1]]
  attributes(results) <- c(
    attributes(results),
    status = parsed$resultsPage$status,
    perPage = parsed$resultsPage$perPage,
    page = parsed$resultsPage$page,
    totalEntries = parsed$resultsPage$totalEntries
  )

  results
}

# https://www.songkick.com/developer/upcoming-events-for-artist
get_artist_calendar <- function(artist_id) {
  endpoint <- c("artists", artist_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-venue
get_venue_calendar <- function(venue_id) {
  endpoint <- c("venues", venue_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-metro-area
get_metro_calendar <- function(metro_area_id) {
  endpoint <- c("metro_areas", metro_area_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-user
get_user_event <- function(username) {
  endpoint <- c("users", username, "events.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-user
get_user_calendar <- function(username, reason = "attendance") {
  endpoint <- c("users", username, "calendar.json")
  res <- request(endpoint, list(reason = reason))

  res # calendar entry objs
}

# https://www.songkick.com/developer/trackings
get_tracked_metro_by_user <- function(username) {
  endpoint <- c("users", username, "metro_areas", "tracked.json")
  res <- request(endpoint)

  res # metro area objs
}

# https://www.songkick.com/developer/trackings
get_tracked_artists_by_user <- function(username) {
  endpoint <- c("users", username, "artists", "tracked.json")
  res <- request(endpoint)

  res # artist objs
}

# https://www.songkick.com/developer/trackings
get_muted_artists_by_user <- function(username) {
  endpoint <- c("users", username, "artists", "muted.json")
  res <- request(endpoint)

  res # artist objs
}

# https://www.songkick.com/developer/past-events-for-artist
get_gigography_artist <- function(artist_id) {
  endpoint <- c("artists", artist_id, "gigography.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/past-events-for-user
get_gigography_user <- function(username) {
  endpoint <- c("users", username, "gigography.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/events-details
get_event <- function(event_id) {
  endpoint <- c("events", paste0(event_id, ".json"))
  res <- request(endpoint)

  res # event obj with venue obj
}

# https://www.songkick.com/developer/venue-details
get_venue <- function(venue_id) {
  endpoint <- c("venues", paste0(venue_id, ".json"))
  res <- request(endpoint)

  res # venue obj
}

# https://www.songkick.com/developer/similar-artists
get_similar_artists <- function(artist_id) {
  endpoint <- c("artists", artist_id, "similar_artists.json")
  res <- request(endpoint)

  res # artist obj
}

# https://www.songkick.com/developer/event-search
search_event <- function(artist_name) {
  endpoint <- c("events.json")
  res <- request(endpoint, list(artist_name = artist_name))

  res # event objs
}

# https://www.songkick.com/developer/artist-search
search_artist <- function(artist_name) {
  endpoint <- c("search", "artists.json")
  res <- request(endpoint, list(query = artist_name))

  res # artist objs
}

# https://www.songkick.com/developer/venue-search
search_venue <- function(venue_name) {
  endpoint <- c("search", "venues.json")
  res <- request(endpoint, list(query = venue_name))

  res # venue objs
}

# https://www.songkick.com/developer/location-search
search_location <- function(location_name) {
  endpoint <- c("search", "locations.json")
  res <- request(endpoint, list(query = location_name))

  res # location objs
}
