get_key <- function() {
  key <- Sys.getenv("songkick_key")

  stopifnot(key != "")

  key
}

#' @importFrom httr GET content
request <- function(endpoint, query = list()) {
  url <- paste0(
    "https://api.songkick.com/api/3.0/",
    endpoint,
    "?"
  )
  query$apikey <- get_key()

  res <- GET(url = url , query = query)
  content(res)
}

# https://www.songkick.com/developer/upcoming-events-for-artist
get_artist_calendar <- function(artist_id) {
  endpoint <- file.path("artists", artist_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-venue
get_venue_calendar <- function(venue_id) {
  endpoint <- file.path("venues", venue_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-metro-area
get_metro_calendar <- function(metro_area_id) {
  endpoint <- file.path("metro_areas", metro_area_id, "calendar.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-user
get_user_event <- function(username) {
  endpoint <- file.path("users", username, "events.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/upcoming-events-for-user
get_user_calendar <- function(username, reason) {
  endpoint <- file.path("users", username, "calendar.json")
  res <- request(endpoint, list(reason = reason))

  res # calendar entry objs
}

# https://www.songkick.com/developer/trackings
get_tracked_metro_by_user <- function(username) {
  endpoint <- file.path("users", username, "metro_areas", "tracked.json")
  res <- request(endpoint)

  res # metro area objs
}

# https://www.songkick.com/developer/trackings
get_tracked_artists_by_user <- function(username) {
  endpoint <- file.path("users", username, "artists", "tracked.json")
  res <- request(endpoint)

  res # artist objs
}

# https://www.songkick.com/developer/trackings
get_muted_artists_by_user <- function(username) {
  endpoint <- file.path("users", username, "artists", "muted.json")
  res <- request(endpoint)

  res # artist objs
}

# https://www.songkick.com/developer/past-events-for-artist
get_gigography_artist <- function(artist_id) {
  endpoint <- file.path("artists", artist_id, "gigography.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/past-events-for-user
get_gigography_user <- function(username) {
  endpoint <- file.path("users", username, "gigography.json")
  res <- request(endpoint)

  res # event obj
}

# https://www.songkick.com/developer/events-details
get_event <- function(event_id) {
  endpoint <- file.path("events", paste0(event_id, ".json"))
  res <- request(endpoint)

  res # event obj with venue obj
}

# https://www.songkick.com/developer/venue-details
get_venue <- function(venue_id) {
  endpoint <- file.path("venues", paste0(venue_id, ".json"))
  res <- request(endpoint)

  res # venue obj
}

# https://www.songkick.com/developer/similar-artists
get_similar_artists <- function(artist_id) {
  endpoint <- file.path("artists", artist_id, "similar_artists.json")
  res <- request(endpoint)

  res # artist obj
}

# https://www.songkick.com/developer/event-search
search_event <- function(artist_name, location) {
  endpoint <- file.path("events.json")
  res <- request(endpoint, list(artist_name = artist_name, location = location))

  res # event objs
}

# https://www.songkick.com/developer/artist-search
search_artist <- function(artist_name) {
  endpoint <- file.path("search", "artists.json")
  res <- request(endpoint, list(query = artist_name))

  res # artist objs
}

# https://www.songkick.com/developer/venue-search
search_venue <- function(venue_name) {
  endpoint <- file.path("search", "venues.json")
  res <- request(endpoint, list(query = venue_name))

  res # venue objs
}

# https://www.songkick.com/developer/location-search
search_location <- function(location_name) {
  endpoint <- file.path("search", "locations.json")
  res <- request(endpoint, list(query = location_name))

  res # location objs
}
